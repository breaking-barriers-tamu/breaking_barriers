class Event < ApplicationRecord
    validates :name, :location, :date, :time presence: true
end
