# frozen_string_literal: true

FactoryBot.define do
  factory :announcement do
    association :user
    title { 'My Announcement Title' }
    body { 'My Announcement Body' }
    timestamp { Time.now.utc }
  end
end
