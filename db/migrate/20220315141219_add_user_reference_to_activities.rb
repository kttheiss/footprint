class AddUserReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :users
    add_index :activities, :user_id
    change_column_null :activities, :user_id, false
  end
end
