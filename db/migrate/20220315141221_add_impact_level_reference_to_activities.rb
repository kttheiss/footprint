class AddImpactLevelReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :footprint_tallies, column: :footprint_level_id
    add_index :activities, :footprint_level_id
    change_column_null :activities, :footprint_level_id, false
  end
end
