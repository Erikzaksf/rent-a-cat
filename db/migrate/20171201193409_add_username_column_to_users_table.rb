class AddUsernameColumnToUsersTable < ActiveRecord::Migration[5.0]
  change_table :users do |t|
    t.column :user_name, :text
  end
end
