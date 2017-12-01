class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|

      t.column :name, :text
      t.column :about, :text
      t.column :traits, :text
      t.column :price, :integer

      t.timestamps
    end
    create_table :comments do |t|
      t.column :user_id, :integer
      t.column :cat_id, :integer
      t.column :content, :text

      t.timestamps
    end
  end
end
