require 'rails_helper'

feature 'Event signup', type: :feature do
  let!(:event) { create(:event, name: 'Existing Event', date: '2023-12-31', time: '15:30:00', location: 'Event Location') }
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 2, registration_completed: true) }

  scenario 'Sign up for an event' do
    sign_in(user)
    visit event_path(event)
    click_on 'Sign up for this event'
    expect(page).to have_content("You are signed up for this event!")
    expect(EventLog.where(user: user, event: event)).not_to be_empty()
  end

  scenario 'Remove myself from an event' do
    sign_in(user)
    visit event_path(event)
    click_on 'Sign up for this event'
    visit event_path(event)
    click_on 'Remove me from this event'
    expect(page).to have_content("Successfully removed you from this event.")
    expect(EventLog.where(user: user, event: event)).to be_empty()
  end

end
