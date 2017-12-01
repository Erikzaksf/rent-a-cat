class ChangeUserEmailAttributes < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up   { t.change :email, :string, null: false }
        dir.down { t.change :email, :string, null: false, case_sensitive: true }
      end
    end
  end
end
