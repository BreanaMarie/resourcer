class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :employments

  def full_name 
    "#{firstname} #{lastname}"
  end
end
