class User < ApplicationRecord(level)
  Test.joins('JOIN results ON results.test_id = tests.id')
  .where('user_id = ? AND complexity = ?', id, level)
end
