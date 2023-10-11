# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :users, through: :event_logs
  has_many :event_logs, dependent: :destroy
  
  accepts_nested_attributes_for :event_logs

  validates :name, :description, :datetime, :duration, presence: true

  def is_active?
    event_enabled && datetime.future?
  end
  
end
