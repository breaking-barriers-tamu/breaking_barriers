class Announcement < ApplicationRecord
  belongs_to :user
  has_rich_text :body

  has_many :comments, dependent: :destroy
end
