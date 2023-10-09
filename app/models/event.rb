# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :users, through: :event_logs
  has_many :event_logs, dependent: :destroy

  validates :name, :location, :date, :time, presence: true

  accepts_nested_attributes_for :event_logs
end
