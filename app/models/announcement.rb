class Announcement < ApplicationRecord
  belongs_to :user
  has_rich_text :body

  has_many :comments, -> { order(created_at: :asc) }, dependent: :destroy
  validates :title, :user_id, :timestamp, presence: true
end
