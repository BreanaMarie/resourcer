class Profile < ActiveRecord::Base
  # attr_accessible :city, :firstname, :lastname, :role

  belongs_to :user
  has_many :employments
  has_many :messages

  def full_name 
    "#{firstname} #{lastname}"
  end


  def self.search(search)
    if search
      where('city ILIKE ? OR firstname ILIKE ? OR lastname ILIKE ? OR role ILIKE ? OR company ILIKE?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
