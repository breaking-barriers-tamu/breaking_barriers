# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    def index
      @active_events = Event.where(event_enabled: true)
    end
  end
end
