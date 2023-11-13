# frozen_string_literal: true

require 'rails_helper'

describe 'User profile events list', type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', phone_number: '(214) 123 - 4567', access_level: 1, registration_completed: true, year: 2023) }
  let!(:user2) { create(:user, first_name: 'first_name_2', last_name: 'last_name_2', phone_number: '(214) 123 - 4567', access_level: 1, registration_completed: true) }
  let!(:event) { create(:event, name: 'Event 1', datetime: '2023-12-31 05:30 PM', location: 'Event Location', duration: 1.0) }

  before do
    create(:event_log, event_id: event.id, user_id: user.id, participating: false, confirmed: false)
  end

  it 'sunny day - Event is present in page' do
    sign_in(user)
    visit edit_user_path(user)
    expect(page).to(have_content('Event 1'))
    expect(page).to(have_content('December 31, 2023'))
    expect(page).to(have_content('1.0'))
    expect(page).to(have_content('X'))
  end

  it 'rainy day (security) - Event is not present in page if not signed up' do
    sign_in(user2)
    visit edit_user_path(user2)
    expect(page).not_to(have_content('Event 1'))
    expect(page).not_to(have_content('December 31, 2023'))
    expect(page).not_to(have_content('1.0'))
  end
end
