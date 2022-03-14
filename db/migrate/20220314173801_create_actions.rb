class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.date :date
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.text :description
      t.integer :footprint_level_id

      t.timestamps
    end
  end
end
