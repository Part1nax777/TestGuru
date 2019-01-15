class AddNotNullForKeys < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:results, :user_id, false)
    change_column_null(:results, :test_id, false)
  end
end
