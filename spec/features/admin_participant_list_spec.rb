# frozen_string_literal: true

require 'rails_helper'

describe 'Participants List', type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', phone_number: '(214) 123 - 4567', access_level: 1, registration_completed: true) }
  let!(:event_log2) { create(:event_log, event_id: event2.id, user_id: user2.id, participating: false, confirmed: false) }
  let!(:user2) { create(:user, first_name: 'first_name_2', last_name: 'last_name_2', phone_number: '(214) 123 - 4567', access_level: 1, registration_completed: true) }
  let!(:event) { create(:event, name: 'Event 1', datetime: '2023-12-31 05:30 PM', location: 'Event Location') }
  let!(:event2) { create(:event, name: 'Event 2', datetime: '2023-12-31 05:30 PM', location: 'Event Location') }

  before do
    create(:event_log, event_id: event.id, user_id: user.id, participating: false, confirmed: false)
  end

  it 'sunny day - click confirm correctly' do
    sign_in(user)
    visit admin_event_path(event)
    event_log1 = EventLog.where(event_id: event.id).first
    expect(event_log1.confirmed).to(eq(false))
    expect(page).to(have_content(user.first_name))
    expect(page).to(have_content(user.last_name))
    expect(page).to(have_content('Participants: 0'))
    click_button 'Confirm'
    expect(event_log1.reload.confirmed).to(eq(true))
    # usability: provide feedback to user:
    expect(page).to(have_content('Successfully confirmed'))
    expect(event_log1.reload.participating).to(eq(true))
  end

  it 'rainy day - click deny' do
    sign_in(user2)
    visit admin_event_path(event2)
    expect(event_log2.confirmed).to(eq(false))
    expect(page).to(have_content(user2.first_name))
    expect(page).to(have_content(user2.last_name))
    expect(page).to(have_content('Participants: 0'))
    click_button 'Deny'
    expect(event_log2.reload.confirmed).to(eq(true))
    # usability: provide feedback to user:
    expect(page).to(have_content('Successfully denied'))
    expect(event_log2.reload.participating).to(eq(false))
  end
end
