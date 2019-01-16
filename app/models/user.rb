class User < ApplicationRecord(level)
  Test.joins('JOIN results ON results.test_id = tests.id')
    .where(results: { user_id: id }, complexity: level)
end
