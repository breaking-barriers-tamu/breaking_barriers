class Event < ApplicationRecord
    has_many :users, through: :event_logs
    has_many :event_logs

    validates :name, :location, :date, :time, presence: true
end
