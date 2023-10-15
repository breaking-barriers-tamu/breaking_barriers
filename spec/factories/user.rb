# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@tamu.edu" }
    password { 'secret' }
  end
end
