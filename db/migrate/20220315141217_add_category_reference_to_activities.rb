class AddCategoryReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :categories
    add_index :activities, :category_id
    change_column_null :activities, :category_id, false
  end
end
