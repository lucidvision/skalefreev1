class ChangeStringToText < ActiveRecord::Migration
  def up
  	change_column :forumposts, :content, :text
  end

  def down
  	change_column :forumposts, :content, :string
  end
end
