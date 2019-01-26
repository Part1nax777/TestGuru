class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :question_count_error

  scope :correct, -> { where(correct: true) }

private

  def question_count_error
    errors.add(:question, 'maximum answers must be < 4') if question.answers.count >= 4
  end
end
