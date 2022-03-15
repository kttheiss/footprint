class AddUserReferenceToActivityLogs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activity_logs, :users
    add_index :activity_logs, :user_id
    change_column_null :activity_logs, :user_id, false
  end
end
