# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :users, through: :event_logs
  has_many :event_logs, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  
  accepts_nested_attributes_for :event_logs

  belongs_to :officer, class_name: 'User', foreign_key: 'officer_in_charge', optional: true

  validates :name, :description, :datetime, :duration, presence: true

  def is_active?
    event_enabled && datetime.future?
  end
  
  def has_participants?
    event_logs.any?
  end

end
