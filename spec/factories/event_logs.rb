FactoryBot.define do
  factory :event_log do
    hourlog_id { 1 }
    user_id { 1 }
    event_id { 1 }
    hours { 1.5 }
  end
end
