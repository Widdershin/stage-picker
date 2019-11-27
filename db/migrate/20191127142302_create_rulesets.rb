class CreateRulesets < ActiveRecord::Migration[6.0]
  def change
    create_table :rulesets do |t|
      t.belongs_to :user

      t.text :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
