# frozen_string_literal: true

require 'rails_helper'

describe 'Event Log Index Security', type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', phone_number: '(214) 123 - 4567', access_level: 1, registration_completed: true) }
  let!(:event_log2) { create(:event_log, event_id: event2.id, user_id: user2.id, participating: false, confirmed: false) }
  let!(:user2) { create(:user, first_name: 'first_name_2', last_name: 'last_name_2', phone_number: '(214) 123 - 4567', access_level: 0, registration_completed: true) }
  let!(:event) { create(:event, name: 'Event 1', datetime: '2023-12-31 05:30 PM', location: 'Event Location') }
  let!(:event2) { create(:event, name: 'Event 2', datetime: '2023-12-31 05:30 PM', location: 'Event Location') }

  before do
    create(:event_log, event_id: event.id, user_id: user.id, participating: false, confirmed: false)
  end

  it 'sunny day - admin tries to see event log index page' do
    sign_in(user)
    visit admin_event_logs_path;
    expect(page).to(have_content("Event 1"));
  end

  it 'rainy day - regular user tries to see event log index page' do
    sign_in(user2)
    expect { visit(admin_event_logs_path) }.to(raise_error(ActionController::RoutingError));
  end
end
