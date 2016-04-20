class Message < ActiveRecord::Base
  belongs_to :friendship
  belongs_to :user

  # takes the time created_at and converts it into a readable date and time
  def created
   created_at.strftime('%m-%d-%Y %I:%M')
    
  end
end
