class CreateActivityLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_logs do |t|
      t.string :name
      t.date :date
      t.integer :category_id
      t.integer :user_id
      t.text :description
      t.string :footprint
      t.integer :footprint_number

      t.timestamps
    end
  end
end
