class CreateFootprintTallies < ActiveRecord::Migration[6.0]
  def change
    create_table :footprint_tallies do |t|
      t.string :footprint_level_word
      t.integer :footprint_level_number

      t.timestamps
    end
  end
end
