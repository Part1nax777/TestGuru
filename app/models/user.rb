class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
    def tests_by_level(level)
      test.where(complexity: level)
    end
  scope :tests_by_level, -> (level) { tests.where(complexity: level) }
end
