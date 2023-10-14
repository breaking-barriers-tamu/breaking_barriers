class Announcement < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  validates :title, :user_id, :timestamp, presence: true
end
