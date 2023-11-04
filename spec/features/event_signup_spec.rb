# frozen_string_literal: true

require 'rails_helper'

describe 'Event signup', type: :feature do
  let!(:event) { create(:event, name: 'Existing Event', description: 'Event Description', datetime: '2023-12-31 05:30 PM', event_enabled: true, duration: 1.0) }
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }

  it 'Sign up for an event-- Sunny day' do
    sign_in(user)
    visit event_path(event)
    click_on 'Sign up'
    expect(page).to(have_content('You are signed up for this event!'))
    expect(EventLog.where(user: user, event: event)).not_to(be_empty)
  end

  it 'Sign up for an event present but already signed up-- Rainy day' do
    sign_in(user)
    visit event_path(event)
    click_on 'Sign up'
    expect(page).not_to(have_content('Sign up'))
    expect(EventLog.where(user: user, event: event)).not_to(be_empty)
  end

  it 'Remove myself from an event-- Sunny day' do
    sign_in(user)
    visit event_path(event)
    click_on 'Sign up'
    visit event_path(event)
    click_on 'Remove my request'
    expect(page).to(have_content('Successfully removed you from this event.'))
    expect(EventLog.where(user: user, event: event)).to(be_empty)
  end
end
