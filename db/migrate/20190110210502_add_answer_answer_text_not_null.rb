class AddAnswerAnswerTextNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :answer_text, false)
  end
end
