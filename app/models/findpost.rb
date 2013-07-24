class Findpost < ActiveRecord::Base
  attr_accessible :c1, :c2, :c3, :c4
  belongs_to :user

  validates :user_id, presence: true
  validates :c1, presence: true, length: { maximum: 140 }

  default_scope order: 'findposts.created_at DESC'
end