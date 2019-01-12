class AddNotNullColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :categories_id, false)
    change_column_null(:questions, :question_text, false)
    change_column_null(:questions, :tests_id, false)
    change_column_null(:answers, :answer_text, false)
    change_column_null(:answers, :questions_id, false)
    change_column_null(:users, :name, false)
    change_column_null(:categories, :title, false)
    change_column_null(:answers, :correct, false)
  end
end
