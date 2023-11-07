class PagesController < ApplicationController
  def home
    @upcoming_events = Event.where('datetime >= ? AND event_enabled = ?', Time.zone.now, true)
                            .order(:datetime)
  end
end
