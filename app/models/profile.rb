class Profile < ActiveRecord::Base
	belongs_to :user

  attr_accessible :age, :education, :gender, :interests, :location, :personality, :philosophy, :work, :about

  validates :user_id, presence: true
end