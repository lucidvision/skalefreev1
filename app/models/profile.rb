class Profile < ActiveRecord::Base
	belongs_to :user

  attr_accessible :age, :education, :gender, :interests, :location, :personality, :philosophy, :work, :about

  validates :user_id, presence: true
  validates :age, length: { maximum: 400 }
  validates :education, length: { maximum: 76 }
  validates :gender, length: { maximum: 76 }
  validates :interests, length: { maximum: 76 }
  validates :location, length: { maximum: 76 }
  validates :personality, length: { maximum: 76 }
  validates :philosophy, length: { maximum: 76 }
  validates :work, length: { maximum: 76 }
  validates :about, length: { maximum: 556 }

end