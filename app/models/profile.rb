class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :employments
  has_many :messages

  def full_name 
    "#{firstname} #{lastname}"
  end

  def self.search(search)
    if search
      self.where("full_name LIKE ?", "%#{search}%")
    else
      self.all
    end
  end
end
