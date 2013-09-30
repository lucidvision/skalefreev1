class Forumpost < ActiveRecord::Base
  attr_accessible :content, :forum
  belongs_to :user

  validates :content, presence: true, length: { maximum: 491 }
  validates :forum, presence: true, length: { maximum: 40 }
  validates :user_id, presence: true
  
  default_scope order: 'forumposts.created_at DESC'
end
