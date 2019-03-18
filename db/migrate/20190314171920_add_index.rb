class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index(:tests, %i[complexity title], unique: true)
  end
end
