# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Authentications', type: :feature) do
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

  context 'without signing into app' do
    it 'google sign in button should lead to google authentication page' do
      visit '/users/sign_in'
      click_button 'Sign in with Google'
      expect(User.last.email).to(eq('user@tamu.edu'))
    end
  end
end

RSpec.describe('Authentications - Wrong Account', type: :feature) do
  before do
    OmniAuth.config.test_mode = true
    auth_hash = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123545',
      info: { email: 'user@email.edu' }
    }
                                      )
    OmniAuth.config.mock_auth[:google_oauth2] = auth_hash
  end

  context 'attempt sign in' do
    it 'google should not allow' do
      visit '/users/sign_in'
      click_button 'Sign in with Google'
      expect(page).to(have_content('Could not authenticate you from Google because'))
    end
  end
end
