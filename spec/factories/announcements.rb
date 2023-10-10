FactoryBot.define do
  factory :announcement do
    title { "MyString" }
    body { "MyString" }
    timestamp { "2023-10-04 03:44:19" }
    user
  end
end
