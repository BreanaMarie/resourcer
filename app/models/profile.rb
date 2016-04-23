class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :employments
  has_many :messages

  def full_name 
    "#{firstname} #{lastname}"
  end

  def self.search(search)
    if search
      where('city LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
