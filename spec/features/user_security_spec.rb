# frozen_string_literal: true

require 'rails_helper'

describe 'User Usability Check', type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }

  it 'Sunny Day - Admin can view user info' do
    sign_in(user)
    expect { visit(admin_users_path) }.not_to(raise_error(ActionController::RoutingError))
  end

  it 'Rainy Day - Logged out user cannot view user info' do
    expect { visit(admin_users_path) }.to(raise_error(ActionController::RoutingError))
  end

  it 'Rainy Day - standard user cannot view other user info' do
    user.access_level=0
    sign_in(user)
    expect { visit(admin_users_path) }.to(raise_error(ActionController::RoutingError))
  end
end
