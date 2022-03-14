class AddCategoryReferenceToActions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :actions, :categories
    add_index :actions, :category_id
    change_column_null :actions, :category_id, false
  end
end
