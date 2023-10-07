# frozen_string_literal: true

require 'rails_helper'

describe 'Event CRUD', type: :feature do
  before(:all) do
    Rails.application.load_seed
  end

  let!(:seeded_event) { Event.find_by(name: 'General Meeting') }

  let!(:event) { create(:event, name: 'Existing Event', date: '2023-12-31', time: '05:30 PM', location: 'Event Location', duration: 1.0) }
  let!(:user) { create(:user, first_name: 'first', last_name: 'last', access_level: 1, registration_completed: true) }

  # --- Event Creation ---
  it 'Create an event - Sunny' do
    sign_in(user)
    visit new_admin_event_path

    fill_in 'event[name]', with: 'New Event'
    fill_in 'event[date]', with: '2024-01-01'
    fill_in 'event[time]', with: '15:30:00'
    fill_in 'event[location]', with: 'New Location'
    fill_in 'event[duration]', with: 1.0

    click_on 'Create Event'
    expect(page).to(have_content('Event was successfully created.'))
  end

  it 'Create an event - Rainy' do
    sign_in(user)
    visit new_admin_event_path

    fill_in 'event[name]', with: ''
    fill_in 'event[date]', with: '2024-01-01'
    fill_in 'event[time]', with: '15:30:00'
    fill_in 'event[location]', with: 'New Location'
    fill_in 'event[duration]', with: 1.0

    click_on 'Create Event'
    expect(page).to(have_content("Name can't be blank"))
  end

  # --- Showing Event ---
  it 'Show an event' do
    sign_in(user)
    visit event_path(event)

    expect(page).to(have_content('Existing Event'))
    expect(page).to(have_content('December 31, 2023'))
    expect(page).to(have_content('05:30 PM'))
    expect(page).to(have_content('Event Location'))
  end

  # --- Showing Event ---
  it 'Show an seeded event' do
    sign_in(user)
    visit event_path(seeded_event)

    expect(page).to(have_content('General Meeting'))
    expect(page).to(have_content('October 07, 2023'))
    expect(page).to(have_content('Zach 450'))
  end

  # --- Updating Event ---
  it 'Edit an event - Sunny' do
    sign_in(user)
    visit admin_event_path(event)
    click_on 'Edit this event'

    fill_in 'event[name]', with: 'Updated Event Name'
    fill_in 'event[date]', with: '2024-01-01'
    fill_in 'event[time]', with: '16:30:00'
    fill_in 'event[location]', with: 'Updated Location'

    click_on 'Update Event'
    expect(page).to(have_content('Event was successfully updated.'))
  end

  it 'Edit an event - Rainy' do
    sign_in(user)
    visit admin_event_url(event)
    click_on 'Edit this event'

    fill_in 'event[name]', with: ''
    fill_in 'event[date]', with: '2024-01-01'
    fill_in 'event[time]', with: '16:30:00'
    fill_in 'event[location]', with: 'Updated Location'

    click_on 'Update Event'
    expect(page).to(have_content("Name can't be blank"))
  end

  # --- Destroying Event ---
  it 'Destroy an event' do
    sign_in(user)
    visit admin_event_url(event)
    click_on 'Destroy this event'
    expect(page).to(have_content('Event was successfully destroyed.'))
  end
end
