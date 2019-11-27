class CreateStage < ActiveRecord::Migration[6.0]
  def change
    create_table :stages do |t|
      t.text :name, null: false
      t.text :image_url, null: false

      t.timestamps
    end
  end
end
