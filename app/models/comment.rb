class Comment < ActiveRecord::Base
	attr_accessible :content
  belongs_to :user
  belongs_to :forumpost

  validates :content, presence: true
  validates :user_id, presence: true
  validates :forumpost_id, presence: true
  
end
