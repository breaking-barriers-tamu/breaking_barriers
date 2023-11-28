# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Admin Dashboard Access', type: :feature) do
  let!(:admin) { create(:user, phone_number: '(214) 123 - 4567', first_name: 'first', last_name: 'last', access_level: 1, registration_completed: true) }
  before do
    OmniAuth.config.test_mode = true
    auth_hash = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123545',
      info: { email: 'user@tamu.edu' }
    }
                                      )
    OmniAuth.config.mock_auth[:google_oauth2] = auth_hash
  end

  it 'Admin accesses dashboard' do
    sign_in(admin)

    visit admin_root_path

    expect(page).to(have_content('Active Events'))
  end

  it 'Member tries to access dashboard' do
    visit '/users/sign_in'
    click_button 'Sign in with Google'

    fill_in 'First name', with: 'Jason'
    fill_in 'Last name', with: 'Le'
    select '2024', from: 'Year'
    fill_in 'phone-number', with: '123-456-7890'

    click_button 'Register Account'

    expect { visit(admin_root_path) }.to(raise_error(ActionController::RoutingError))
  end
end
