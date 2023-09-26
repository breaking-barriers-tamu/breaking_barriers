# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with valid attributes" do
    event = Event.new(name: "My Event", date: Date.today, time: Time.now, location: "Somewhere", description: "Cool description", duration: 5)
    expect(event).to be_valid
  end

end
