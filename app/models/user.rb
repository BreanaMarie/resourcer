class User < ActiveRecord::Base
  has_one :profile

  has_secure_password

  attr_accessor :email, :password, :password_confirmation

  validates_uniqueness_of :email

  validates :password, presence: true,
                        length: {
                          minimum: 6,
                          maximum: 20
                        }
  validates :password_confirmation, presence: true


end
