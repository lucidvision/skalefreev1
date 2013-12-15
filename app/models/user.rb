class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable 

  acts_as_messageable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  has_many :findposts, dependent: :destroy
  has_many :forumposts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 15 }

  has_reputation :votes, source: :user, aggregated_by: :sum

  default_scope order: 'users.created_at DESC'

  def mailboxer_email(object)
    email
  end

  def active_for_authentication?
    super and self.active?
  end
end