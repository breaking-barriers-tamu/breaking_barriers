# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Announcement.destroy_all
Event.destroy_all
EventLog.destroy_all

user1 = User.create!(
  first_name: 'Admin',
  last_name: '1',
  email: 'Member1@tamu.edu',
  password: 'password',
  password_confirmation: 'password',
  access_level: 'admin'
)

user2 = User.create!(
  first_name: 'Member',
  last_name: '1',
  email: 'Member2@tamu.edu',
  password: 'password',
  password_confirmation: 'password',
  access_level: 'member'
)

Announcement.create!(
  user: user1,
  title: 'Announcement 1',
  body: 'This is an announcement from Admin 1.',
  timestamp: DateTime.new(2023, 10, 7, Time.now.hour, Time.now.min, Time.now.sec)
)

Announcement.create!(
  user: user1,
  title: 'Announcement 2',
  body: 'This is another annocument from Admin 1',
  timestamp: DateTime.new(2023, 10, 8, Time.now.hour, Time.now.min, Time.now.sec)
)


# Assuming you already have user1 and user2 created from before...

# Seed a few events
event1 = Event.create!(
  name: 'General Meeting',
  datetime: DateTime.new(2023, 10, 7, Time.now.hour, Time.now.min),
  location: 'Zach 450',
  description: 'Doing Nothing',
  duration: 2.5
)

event2 = Event.create!(
  name: 'General Meeting 2',
  datetime: DateTime.new(2023, 10, 7, Time.now.hour, Time.now.min),
  location: 'Zach 420',
  description: 'Testing',
  duration: 1.5
)

# Seed event logs for users related to the events
EventLog.create!(
  user: user1,
  event: event1,
  hours: 2.5,
  participating: true
)

EventLog.create!(
  user: user1,
  event: event2,
  hours: 1.5,
  participating: false
)
