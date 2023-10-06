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
  body: 'This is an announcement from Admin 1.'
)

Announcement.create!(
  user: user1,
  body: 'This is another annocument from Admin 1'
)


# Assuming you already have user1 and user2 created from before...

# Seed a few events
event1 = Event.create!(
  name: 'General Meeting',
  date: Date.new(2023, 10, 7),
  time: Time.now,
  location: 'Zach 450',
  description: 'Doing Nothing',
  duration: 2.5
)

event2 = Event.create!(
  name: 'General Meeting 2',
  date: Date.new(2023, 10, 9),
  time: Time.now,
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
