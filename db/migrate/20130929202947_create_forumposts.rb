class CreateForumposts < ActiveRecord::Migration
  def change
    create_table :forumposts do |t|
      t.string :forum
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :forumposts, [:user_id, :created_at]
  end
end
