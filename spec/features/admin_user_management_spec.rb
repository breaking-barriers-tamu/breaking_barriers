# frozen_string_literal: true

require 'rails_helper'

describe 'User Management', type: :feature do
  let!(:user) { create(:user, first_name: 'B', last_name: 'Y', access_level: 1, registration_completed: true) }
  let!(:user2) { create(:user, first_name: 'B', last_name: 'G', access_level: 0, registration_completed: true) }
  let!(:user3) { create(:user, first_name: 'A', last_name: 'Z', access_level: 0, registration_completed: true) }
  let!(:event) { create(:event, name: 'Event 1', datetime: '2001-12-31 15:30:00', location: 'Event Location') }
  let!(:event2) { create(:event, name: 'Event 2', datetime: '2201-12-31 15:30:00', location: 'Event Location') }
  let!(:event_log1) { create(:event_log, event_id: event.id, user_id: user.id, hours: 0.5, participating: true) }
  let!(:event_log2) { create(:event_log, event_id: event2.id, user_id: user.id, hours: 1.5, participating: true) }
  let!(:event_log3) { create(:event_log, event_id: event.id, user_id: user2.id, hours: 0.5, participating: false) }
  let!(:event_log4) { create(:event_log, event_id: event2.id, user_id: user2.id, hours: 1.5, participating: true) }
  let!(:event_log5) { create(:event_log, event_id: event.id, user_id: user3.id, hours: 2.5, participating: true) }
  let!(:event_log6) { create(:event_log, event_id: event2.id, user_id: user3.id, hours: 1.5, participating: false) }
  
  it 'sunny day - admin visits page' do
    sign_in(user)
    visit admin_users_path
    expect(page.text).to match(/A[\S\s]*Z[\S\s]*B[\S\s]*G[\S\s]*B[\S\s]*Y/)
    expect(page).to(have_content(user.first_name))
    expect(page).to(have_content(user2.first_name))
    expect(page).to(have_content(user3.first_name))

    expect(page).to(have_content('0.5'))
    expect(page).to(have_content('0'))
    expect(page).to(have_content('2.5'))
  end

  it 'rainy day - member visits page' do
    sign_in(user2)
    expect { visit(admin_users_path) }.to(raise_error(ActionController::RoutingError))

  end
end
