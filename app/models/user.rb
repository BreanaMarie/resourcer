class User < ActiveRecord::Base
  has_secure_password
  has_one :profile
  has_many :friendships
  has_many :friends, :through => :friendships, :class_name => "User"
  has_many :messages
  has_many :events
  # attr_accessor :email, :password, :password_confirmation
  validates_uniqueness_of :email
end
