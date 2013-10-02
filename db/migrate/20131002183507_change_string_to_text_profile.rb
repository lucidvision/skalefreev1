class ChangeStringToTextProfile < ActiveRecord::Migration
  def up
  	change_column :profiles, :about, :text
  end

  def down
  	change_column :profiles, :about, :string
  end
end
