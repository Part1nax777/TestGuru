class AddDefaultComplexityDefaultCorrect < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :complexity, 0)
    change_column_default(:answers, :valid, false)
  end
end
