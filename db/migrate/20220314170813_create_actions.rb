class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.date :date
      t.string :name
      t.integer :category_id
      t.integer :impact_level_value
      t.string :impact_level
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
