class AddUniqForTitleComplexity < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, [:title, :complexity], unique: true
  end
end
