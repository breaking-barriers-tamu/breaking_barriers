# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@tamu.edu" }
    password { 'secret' }
  end
end
