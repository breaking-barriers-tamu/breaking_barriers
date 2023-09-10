# Seed data for events
events = [
  {
    name: 'Test Event',
    date: Date.parse('2023-09-10'),
    time: Time.parse('2000-01-01 16:11:00 UTC'),
    location: 'Testing Center',
  },
  {
    name: 'Test Event 2',
    date: Date.parse('2023-09-13'),
    time: Time.parse('2000-01-01 20:14:00 UTC'),
    location: 'Location 2',
  },
  {
    name: 'Test Event 3',
    date: Date.parse('2023-11-06'),
    time: Time.parse('2000-01-01 05:17:00 UTC'),
    location: 'Zach',
  },
  {
    name: 'Test Event 4',
    date: Date.parse('2023-12-05'),
    time: Time.parse('2000-01-01 04:14:00 UTC'),
    location: 'The Moon',
  },
  {
    name: 'Test Event 5',
    date: Date.parse('2023-09-10'),
    time: Time.parse('2000-01-01 16:13:00 UTC'),
    location: 'TBD',
  }
]

events.each do |event_data|
  Event.create!(event_data)
end