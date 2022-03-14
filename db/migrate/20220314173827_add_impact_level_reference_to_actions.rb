class AddImpactLevelReferenceToActions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :actions, :footprint_tallies, column: :footprint_level_id
    add_index :actions, :footprint_level_id
    change_column_null :actions, :footprint_level_id, false
  end
end
