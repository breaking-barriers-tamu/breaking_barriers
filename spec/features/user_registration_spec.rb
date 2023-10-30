# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('User Registration Form', type: :feature) do
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

  context 'user create and ' do
    it 'allows the user to fill out and submit the form successfully' do
      visit '/users/sign_in'
      click_button 'Sign in with Google'

      fill_in 'First name', with: 'Jason'
      fill_in 'Last name', with: 'Le'
      select '2024', from: 'Year'
      fill_in 'Phone number', with: '123-456-7890'
      select 'Member', from: 'Access level'

      click_button 'Update'

      expect(page).to(have_content('Jason'))
      expect(page).to(have_content('Le'))
      expect(page).to(have_content('CSCE'))
      expect(page).to(have_content('2024'))
      expect(page).to(have_content('123-456-7890'))
    end
  end

  context 'user create with missing information' do
    it 'displays error messages when the form is submitted without necessary information' do
      visit '/users/sign_in'
      click_button 'Sign in with Google'

      select '2024', from: 'Year'
      fill_in 'First name', with: ''
      fill_in 'Phone number', with: '123-456-7890'

      click_button 'Update'

      expect(page).to(have_content("First name can't be blank"))
    end
  end
end
