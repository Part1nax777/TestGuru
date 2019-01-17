class User < ApplicationRecord(level)
  has_many :results
  has_many :tests, through :results
  Test.joins('JOIN results ON results.test_id = tests.id')
    .where(results: { user_id: id }, complexity: level)
end
