class AddUserReferenceToActions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :actions, :users
    add_index :actions, :user_id
    change_column_null :actions, :user_id, false
  end
end
