# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :users, through: :event_logs
  has_many :event_logs, dependent: :destroy
  has_one_attached :flier, dependent: :destroy
  has_rich_text :description

  accepts_nested_attributes_for :event_logs

  belongs_to :officer, class_name: 'User', foreign_key: 'officer_in_charge', optional: true

  validates :name, :datetime, :duration, presence: true

  def is_active?
    event_enabled && datetime.future?
  end

  def has_participants?
    event_logs.any?
  end

  def get_location
    if (location.present?)
      location
    else 
      "TBD"
    end
  end

  def get_duration
    minutes = duration * 60
    "#{(minutes/60).to_i} hours #{(minutes % 60).to_i} minutes"
  end


end
