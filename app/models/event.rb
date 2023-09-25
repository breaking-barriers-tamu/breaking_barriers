class Event < ApplicationRecord
    validates :name, :date, :time, :location, :duration, presence: true
end
