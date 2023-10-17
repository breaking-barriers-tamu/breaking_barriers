# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { 'This is a sample comment.' }
    user
    announcement
  end
end
