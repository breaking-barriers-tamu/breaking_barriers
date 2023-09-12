class Event < ApplicationRecord
    validates :name, :location, :date,  presence: true
end
