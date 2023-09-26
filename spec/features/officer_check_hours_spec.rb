# frozen_string_literal: true

require 'rails_helper'

describe 'Hours Check', type: :feature do
  let!(:user) { create(:user, first_name: "first", last_name: "last", access_level: 2, registration_completed: true) }
  let!(:event1) { create(:event, name: 'Existing Event 1', date: '2001-12-31', time: '15:30:00', location: 'Event Location') }
  let!(:event2) { create(:event, name: 'Existing Event 2', date: '2002-12-31', time: '15:30:00', location: 'Event Location') }
  let!(:event3) { create(:event, name: 'Future Event', date: '9999-12-31', time: '15:30:00', location: 'Event Location') }

  it 'Check hours of 2 completed events' do
    create(:event_log, user_id: user.id, event_id: event1.id, hours: 13.0)
    create(:event_log, user_id: user.id, event_id: event2.id, hours: 2.6)

    sign_in(user)
    visit officer_user_path(user)
    expect(page).to(have_content('15.6'))
  end

  it 'Check hours of 1/1 complete/incomplete' do
    create(:event_log, user_id: user.id, event_id: event1.id, hours: 13.0)
    create(:event_log, user_id: user.id, event_id: event3.id, hours: 10.5)

    sign_in(user)
    visit officer_user_path(user)
    expect(page).to(have_content('13.0'))
  end

  it 'Check hours of no complete' do
    sign_in(user)
    visit officer_user_path(user)
    expect(page).to(have_content('0'))
  end
end
