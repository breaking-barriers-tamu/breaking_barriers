require 'rails_helper'

feature 'Event CRUD', type: :feature do
  let!(:event) { create(:event, name: 'Existing Event', date: '2023-12-31', time: '05:30 PM', location: 'Event Location', duration: 1.0) }
  let!(:user) { create(:user, access_level: 2, registration_completed: true) }
  
  # --- Event Creation ---
  scenario 'Create an event - Sunny' do
    sign_in(user)
    visit new_event_path 

    fill_in "event[name]", with: 'New Event'
    fill_in "event[date]", with: '2024-01-01'
    fill_in "event[time]", with: '15:30:00'
    fill_in "event[location]", with: 'New Location'
    fill_in "event[duration]", with: 1.0

    click_on 'Create Event'
    expect(page).to have_content('Event was successfully created.')
  end

  scenario 'Create an event - Rainy' do
    sign_in(user)
    visit new_event_path 

    fill_in "event[name]", with: ''
    fill_in "event[date]", with: '2024-01-01'
    fill_in "event[time]", with: '15:30:00'
    fill_in "event[location]", with: 'New Location'
    fill_in "event[duration]", with: 1.0

    click_on 'Create Event'
    expect(page).to have_content("Name can't be blank")
  end

  # --- Showing Event ---
  scenario 'Show an event' do
    sign_in(user)
    visit event_path(event.id) 

    expect(page).to have_content('Existing Event')
    expect(page).to have_content('December 31, 2023')
    expect(page).to have_content('05:30 PM')
    expect(page).to have_content('Event Location')
  end

  # --- Updating Event ---
  scenario 'Edit an event - Sunny' do
    sign_in(user)
    visit event_path(event.id)
    click_on 'Edit this event'


    fill_in "event[name]", with: 'Updated Event Name'
    fill_in "event[date]", with: '2024-01-01'
    fill_in "event[time]", with: '16:30:00'
    fill_in "event[location]", with: 'Updated Location'

    click_on 'Update Event' 
    expect(page).to have_content('Event was successfully updated.')
  end

  scenario 'Edit an event - Rainy' do
    sign_in(user)
    visit event_path(event.id)
    click_on 'Edit this event'


    fill_in "event[name]", with: ''
    fill_in "event[date]", with: '2024-01-01'
    fill_in "event[time]", with: '16:30:00'
    fill_in "event[location]", with: 'Updated Location'

    click_on 'Update Event' 
    expect(page).to have_content("Name can't be blank")
  end

  # --- Destroying Event ---
  scenario 'Destroy an event' do
    sign_in(user)
    visit event_path(event)
    click_on 'Destroy this event'
    expect(page).to have_content('Event was successfully destroyed.')
  end
end

