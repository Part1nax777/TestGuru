class AddForeignKeysForResult < ActiveRecord::Migration[5.2]
  def change
    add_reference(:results, :user, foreign_key: true)
    add_reference(:results, :test, foreign_key: true)
  end
end
