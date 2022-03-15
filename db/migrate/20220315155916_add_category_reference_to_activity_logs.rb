class AddCategoryReferenceToActivityLogs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activity_logs, :categories
    add_index :activity_logs, :category_id
    change_column_null :activity_logs, :category_id, false
  end
end
