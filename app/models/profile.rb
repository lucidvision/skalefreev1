class Profile < ActiveRecord::Base
	belongs_to :user

  attr_accessible :age, :education, :gender, :interests, :location, :personality, :philosophy, :work, :about

  validates :user_id, presence: true
  validates :age, length: { maximum: 152 }
  validates :education, length: { maximum: 152 }
  validates :gender, length: { maximum: 152 }
  validates :interests, length: { maximum: 152 }
  validates :location, length: { maximum: 152 }
  validates :personality, length: { maximum: 152 }
  validates :philosophy, length: { maximum: 152 }
  validates :work, length: { maximum: 152 }
  validates :about, length: { maximum: 556 }

end