class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :employments
  has_many :messages

  def full_name 
    "#{firstname} #{lastname}"
  end
end
