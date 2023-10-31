# frozen_string_literal: true

require 'rails_helper'

describe 'Officer In Charge feature', type: :feature do
  let!(:admin1) { create(:user, first_name: 'Bob', last_name: 'Shelby', access_level: 1, registration_completed: true) }
  let!(:admin2) { create(:user, first_name: 'Alice', last_name: 'Smith', access_level: 1, phone_number: '444-444-4444', registration_completed: true) }
  let!(:member) { create(:user, first_name: 'John', last_name: 'Doe', access_level: 0, registration_completed: true) }
  let!(:event) { create(:event, name: 'Existing Event', description: 'Event Description', datetime: '2024-12-31 05:30 PM', location: 'Event Location', duration: 1.0, officer_in_charge: admin2.id) }
  let!(:event_no_officer) { create(:event, name: 'Existing Event', description: 'Event Description', datetime: '2024-12-31 05:30 PM', location: 'Event Location', duration: 1.0, officer_in_charge: nil) }

  # Usability
  it 'Shows when there is no officer in charge' do
    sign_in(member)
    visit event_path(event_no_officer)

    expect(page).to(have_content('No officer assigned'))
  end

  it 'Shows when there is an officer in charge' do
    sign_in(member)
    visit event_path(event)

    expect(page).to(have_content('Officer In Charge: Alice Smith'))
  end

  it 'Allows admin to add/modify officer in charge' do
    sign_in(admin1)

    # Add an officer in charge
    visit admin_event_path(event)
    click_on 'Edit this event'
    select 'Bob Shelby', from: 'event_officer_in_charge'
    click_on 'Update Event'
    expect(page).to(have_content('Officer In Charge: Bob Shelby'))

    # Change an officer in charge
    visit admin_event_path(event)
    click_on 'Edit this event'
    select 'Alice Smith', from: 'event_officer_in_charge'
    click_on 'Update Event'
    expect(page).to(have_content('Officer In Charge: Alice Smith'))

    # Remove an officer in charge
    visit admin_event_path(event)
    click_on 'Edit this event'
    select '', from: 'event_officer_in_charge'
    click_on 'Update Event'
    expect(page).to(have_content('None'))
  end
end
