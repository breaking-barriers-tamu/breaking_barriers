# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    def index
      @activeEvents = Event.where(event_enabled: true)
      @activeSignups = EventLog.where(participating: !true)
    end
  end
end
