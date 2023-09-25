class Event < ApplicationRecord
    has_many :users, through: :event_logs
    validates :name, :date, :time, :location, :duration, presence: true
end
