class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender
      t.string :age
      t.string :location
      t.string :work
      t.string :education
      t.string :philosophy
      t.string :interests
      t.string :personality
      t.string :about
      t.integer :user_id

      t.timestamps
    end
  end
end