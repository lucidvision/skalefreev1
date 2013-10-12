class Forumpost < ActiveRecord::Base
  attr_accessible :content, :forum
  belongs_to :user

  validates :content, presence: true, length: { maximum: 10000 }
  validates :forum, presence: true, length: { maximum: 40 }
  validates :user_id, presence: true
  
  default_scope order: 'forumposts.created_at DESC'

  has_reputation :votes, source: :user, aggregated_by: :sum
end
