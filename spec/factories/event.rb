# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'MyString' }
    description { 'MyString' }
    datetime { '2023-12-31 05:30 PM'}
    location { 'MyString' }
    duration { '9.99' }
  end
end
