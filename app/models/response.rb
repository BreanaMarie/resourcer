class Response < ActiveRecord::Base
  belongs_to :message
  
  default_scope {order('created_at DESC')}

  # takes the time created_at and converts it to pacific standard time and then into a readable date and time
  def created
   created_at.in_time_zone("Pacific Time (US & Canada)").strftime('%m-%d-%Y %I:%M') 
  end
end
