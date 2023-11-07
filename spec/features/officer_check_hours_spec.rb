# frozen_string_literal: true

require 'rails_helper'

describe 'Hours Check', type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }
  let!(:event1) { create(:event, name: 'Existing Event 1', datetime: '2001-12-31 15:30:00', event_enabled: true) }
  let!(:event2) { create(:event, name: 'Existing Event 2', datetime: '2002-12-31 15:30:00', event_enabled: true) }
  let!(:event3) { create(:event, name: 'Future Event', datetime: '9999-12-31 15:30:00', event_enabled: true) }

  it 'Check hours of 2 completed events with one without participating' do
    create(:event_log, user_id: user.id, event_id: event1.id, hours: 13.0, participating: true)
    create(:event_log, user_id: user.id, event_id: event2.id, hours: 2.6, participating: false)

    sign_in(user)
    visit edit_admin_user_path(user)
    expect(page).to(have_content('13.0'))
  end

  it 'Check hours of 1/1 complete/incomplete' do
    create(:event_log, user_id: user.id, event_id: event1.id, hours: 13.0, participating: true)
    create(:event_log, user_id: user.id, event_id: event3.id, hours: 10.5, participating: true)

    sign_in(user)
    visit edit_admin_user_path(user)
    expect(page).to(have_content('13.0'))
  end

  it 'Check hours of no complete' do
    sign_in(user)
    visit edit_admin_user_path(user)
    expect(page).to(have_content('0'))
  end
end
