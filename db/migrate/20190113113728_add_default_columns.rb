class AddDefaultColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :correct, from: true, to: false)
    change_column_default(:tests, :complexity, from: nil, to: 0)
  end
end
