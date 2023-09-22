class User < ApplicationRecord
    has_many :events, through: :event_logs
    has_many :user_books
end
