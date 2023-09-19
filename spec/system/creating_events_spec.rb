require 'rails_helper'

RSpec.describe "CreatingEvents", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'create event' do
    visit new_event_path 
    fill_in "event[name]", with: 'EventName'
    fill_in "event[date]", with: '2025-01-01'
    fill_in "event[time]", with: '17:30:00'
    fill_in "event[location]", with: 'Zach 420'
    click_on 'Create Event'
    expect(page).to have_content('Event was successfully created')

    click_on 'Edit this event'

    expect(page).to have_content('Editing event')
    fill_in "event[name]", with: 'newEventName'

    click_on 'Update Event'
    expect(page).to have_content('Event was successfully updated')

    click_on 'Destroy this event'
    expect(page).to have_content('Event was successfully destroyed.')
  end

end
