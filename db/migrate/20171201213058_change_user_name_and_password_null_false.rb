class ChangeUserNameAndPasswordNullFalse < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :users do |t|
          dir.up   { t.change :user_name, :text, unique: true }
          dir.down { t.change :user_name, :text, unique: true,  null: false, case_sensitive: true }

      end
    end
  end
end
