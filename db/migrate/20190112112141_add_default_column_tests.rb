class AddDefaultColumnTests < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :compexity, from: nil, to: 0)
  end
end
