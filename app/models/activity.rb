ACTIVITY_CHANNEL = "activity_channel"

class Activity < ActiveRecord::Base
  belongs_to :actor, :class_name => "Artist"
  belongs_to :sprite
  belongs_to :series, :class_name => "SpriteSeries"
  
  after_create :send_event
  
  protected
  
  def send_event
    Pusher[ACTIVITY_CHANNEL].trigger('activity', {:message => "Something happened!"})
  end
end
