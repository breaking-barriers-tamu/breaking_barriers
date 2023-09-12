FactoryBot.define do
    factory :event do
      name { "EventName" }
      date { Date.today + 1.day }
      time { Time.now }
      location { "EventLocation" }
    end
  end