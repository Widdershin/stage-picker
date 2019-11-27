class AddCompetitiveToStages < ActiveRecord::Migration[6.0]
  def change
    add_column :stages, :is_competitive, :boolean, default: false
  end
end
