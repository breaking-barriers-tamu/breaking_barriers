# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Event Security', type: :feature) do
  let!(:user) { create(:user, first_name: "first", last_name: "last", access_level: 0, registration_completed: true) }
  let!(:event) { create(:event, name: 'Existing Event', date: '2023-12-31', time: '05:30 PM', location: 'Event Location', duration: 1.0) }

  it 'Does not allow non-registered users to access events' do
    sign_in(user)
    expect { visit(admin_events_path) }.to(raise_error(ActionController::RoutingError))
  end

  it 'Does not allow non-admins to create events' do
    sign_in(user)
    expect { visit(new_admin_event_path) }.to(raise_error(ActionController::RoutingError))
  end

  it 'Does not allow non-admins to edit events' do
    sign_in(user)
    expect { visit(edit_admin_event_path(event)) }.to(raise_error(ActionController::RoutingError))
  end
end
