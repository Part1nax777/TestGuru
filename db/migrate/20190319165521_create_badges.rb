class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :badge_url, null: false
      t.string :rule, null: false
      t.string :rule_params

      t.timestamps
    end
  end
end
