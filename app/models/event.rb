class Event < ApplicationRecord
    has_many :users, through: :event_logs
    has_many :event_logs, dependent: :destroy
    
    validates :name, :date, :time, :location, :duration, presence: true
end
