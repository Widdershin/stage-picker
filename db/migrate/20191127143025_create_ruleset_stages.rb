class CreateRulesetStages < ActiveRecord::Migration[6.0]
  def change
    create_table :ruleset_stages do |t|
      t.belongs_to :ruleset
      t.belongs_to :stage

      t.boolean :is_starter

      t.timestamps
    end
  end
end
