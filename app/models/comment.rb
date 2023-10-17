# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :announcement
  belongs_to :user

  validates :content, presence: true
end
