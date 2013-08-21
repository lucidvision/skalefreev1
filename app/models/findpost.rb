class Findpost < ActiveRecord::Base
  attr_accessible :c1, :c2, :c3, :c4, :c5, :c6
  belongs_to :user

  validates :user_id, presence: true
  validates :c1, presence: true, length: { maximum: 70 }
  validates :c2, length: { maximum: 70 }
  validates :c3, length: { maximum: 70 }
  validates :c4, length: { maximum: 70 }
  validates :c5, length: { maximum: 70 }
  validates :c6, length: { maximum: 70 }


  default_scope order: 'findposts.created_at DESC'
end