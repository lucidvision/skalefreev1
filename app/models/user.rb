class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  has_many :findposts, dependent: :destroy
  has_one :profile, dependent: :destroy

  def mailboxer_email(object)
    email
  end
end