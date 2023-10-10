# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :users, through: :event_logs
  has_many :event_logs, dependent: :destroy

  validates :name, :description, :datetime, presence: true

  def is_active?
    event_enabled? && datetime > Time.now.in_time_zone("Central Time (US & Canada)")
  end
  

end
