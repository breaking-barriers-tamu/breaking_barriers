class Event < ApplicationRecord
<<<<<<< Updated upstream
    validates :name, presence: true
=======
    validates :name, :location, :date, presence: true
>>>>>>> Stashed changes
end
