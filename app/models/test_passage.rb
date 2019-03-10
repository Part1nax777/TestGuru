class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def result_percent
    ((100.0 / test.questions.count)*correct_questions).to_i
  end

  def successful_test?
    result_percent >= 85
  end

  def quantity_questions
    test.questions.count
  end

  def number_question
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
   correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
