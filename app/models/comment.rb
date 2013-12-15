class Comment < ActiveRecord::Base

	attr_accessible :content
  belongs_to :user
  belongs_to :forumpost

  validates :user_id, presence: true
  validates :forumpost_id, presence: true
  
end
