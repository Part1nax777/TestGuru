class AddForeignKeyAuthorIdNotNull < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tests, :users, column: :author_id
    change_column_null :tests, :author_id, false
  end
end
