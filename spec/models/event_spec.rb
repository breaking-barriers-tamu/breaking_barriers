# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Event, type: :model) do
  it 'is valid with valid attributes' do
    event = described_class.new(name: 'My Event', datetime: Time.zone.now, location: 'Somewhere', description: 'Cool description', duration: 5)
    expect(event).to(be_valid)
  end
end
