# frozen_string_literal: true

require 'rails_helper'

describe 'Event Enable/Disable', type: :feature do
  let!(:user) { create(:user, first_name: 'first', last_name: 'last', access_level: 1, registration_completed: true) }
  let!(:event) { create(:event, name: 'Existing Event', datetime: '2023-12-31 15:30:00', event_enabled: true) }

  it 'Shows event is enabled' do
    sign_in(user)
    visit event_path(event)
    expect(page).to(have_content('Sign Up'))
  end

  it 'Shows a disabled event is disabled' do
    sign_in(user)
    event.update(event_enabled: false)
    visit event_path(event)
    expect(page).to(have_content('Sign Up Disabled'))
  end

  it 'Sunny Day - A user tries to sign up for an event that is enabled' do
    sign_in(user)
    visit event_path(event)
    click_link 'Sign Up'
    expect(page).to(have_content('You are signed up to volunteer for this event!'))
    expect(EventLog.where(user: user, event: event)).not_to(be_empty)
  end

  it 'Rainy Day - A user tries to sign up for an event that is disabled' do
    sign_in(user)
    event.update(event_enabled: false)
    visit event_path(event)

    expect(page).to(have_content('Sign Up Disabled'))
    expect(EventLog.where(user: user, event: event)).to(be_empty)
  end
end
