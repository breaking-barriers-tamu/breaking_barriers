# frozen_string_literal: true

# This file should contain all the record creation needed
# to seed the database with its default values.
# The data can then be loaded with:
# bin/rails db:seed
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Announcement.destroy_all
Event.destroy_all
EventLog.destroy_all

EditableContent.create!(
  description: 'President- Natalia Miroballi'
)

user1 = User.create!(
  first_name: 'Juan',
  last_name: 'Carrasco',
  email: 'wchwh2002@tamu.edu',
  password: 'password',
  password_confirmation: 'password',
  access_level: 'admin'
)

user2 = User.create!(
  first_name: 'Natalia',
  last_name: 'Miroballi',
  email: 'natmiroballi@tamu.edu',
  password: 'password',
  password_confirmation: 'password',
  access_level: 'admin'
)