# frozen_string_literal: true

class EventLog < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
