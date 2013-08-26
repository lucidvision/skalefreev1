class Profile < ActiveRecord::Base
	belongs_to :user

  attr_accessible :age, :education, :gender, :interests, :location, :personality, :philosophy, :work, :about

  validates :user_id, presence: true
  validates :age, length: { maximum: 140 }
  validates :education, length: { maximum: 140 }
  validates :gender, length: { maximum: 140 }
  validates :interests, length: { maximum: 140 }
  validates :location, length: { maximum: 140 }
  validates :personality, length: { maximum: 140 }
  validates :philosophy, length: { maximum: 140 }
  validates :work, length: { maximum: 140 }
  validates :about, length: { maximum: 300 }

end