# frozen_string_literal: true

require 'rails_helper'

describe 'Participants List', type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }
  let!(:user2) { create(:user, first_name: 'first_name_2', last_name: 'last_name_2', access_level: 1, registration_completed: true) }
  let!(:event) { create(:event, name: 'Event 1', date: '2001-12-31', time: '15:30:00', location: 'Event Location') }
  let(:event_log1) { create(:event_log, event_id: event.id, user_id: user.id, participating: false) }
  let(:event_log2) { create(:event_log, event_id: event.id, user_id: user2.id, participating: false) }

  before do
    sign_in(user)
    visit admin_event_path(event)
  end

  it 'sunny day - click confirm correctly' do
    expect(event_log1.confirmed).to eq(false)
    expect(page).to(have_content(user.first_name))
    expect(page).to(have_content(user.last_name))
    expect(page).to(have_content('Participants: 1'))
    click_button 'Confirm'
    visit admin_event_path(event)
    expect(event_log1.confirmed).to eq(true)
    expect(event_log1.participating).to eq(true)
  end

  it 'rainy day - click deny' do
    expect(event_log1.confirmed).to eq(false)
    expect(page).to(have_content(user.first_name))
    expect(page).to(have_content(user.last_name))
    click_button 'Deny'
    visit admin_event_path(event)
    expect(page).to(have_content('Participants: 0'))
    expect(event_log1.confirmed).to eq(true)
    expect(event_log1.participating).to eq(false)
  end
end
