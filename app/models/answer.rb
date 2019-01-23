class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :question_count_error

private

  def question_count_error
    errors.add(:question, 'maximum answers must be < 4') if: question.answers.count >= 4
  end
end
