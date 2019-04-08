class TestPassage < ApplicationRecord
  PERCENT_SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  scope :success, -> { where('percent >= ?', PERCENT_SUCCESS) }

  def completed?
    timeout
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.percent = result_percent
    save!
  end

  def result_percent
    ((100.0 / test.questions.count)*correct_questions).to_i
  end

  def successful_test?
    result_percent >= PERCENT_SUCCESS
  end

  def quantity_questions
    test.questions.count
  end

  def number_question
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def timeout
    current_question = nil if Time.current > active_time
  end

  def time_left
    (active_time - Time.current).to_i
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

  def active_time
    created_at + test.timer.seconds
  end
end
