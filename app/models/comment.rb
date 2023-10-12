class Comment < ApplicationRecord
  belongs_to :announcement
  belongs_to :user

  validates :content, presence: true, format: { with: /\A\S*\z/ }
end
