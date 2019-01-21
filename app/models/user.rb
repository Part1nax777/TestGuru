class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :user_to_tests, class_name: 'Test', foreign_key: 'author_id'
  def select_tests_by_level(level)
    test.where(complexity: level)
  end
end
