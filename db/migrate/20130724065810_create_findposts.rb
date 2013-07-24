class CreateFindposts < ActiveRecord::Migration
  def change
    create_table :findposts do |t|
      t.string :c1
      t.string :c2
      t.string :c3
      t.string :c4
      t.string :c5
      t.string :c6
      t.integer :user_id

      t.timestamps
    end
    add_index :findposts, [:user_id, :created_at]
  end
end
