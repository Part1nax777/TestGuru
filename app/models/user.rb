class User < ApplicationRecord
  VALID_EMAIL = /.+@.+\..+/i

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
                    format: VALID_EMAIL,
                    uniqueness: true

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def tests_complexity(level)
    tests.test_complexity(level)
  end
end
