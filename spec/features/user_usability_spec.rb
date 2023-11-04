# frozen_string_literal: true

require 'rails_helper'

describe 'User Usability Check', type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }

  it 'Sunny Day - Admin can view admin pages' do
    puts page.body
    sign_in(user)
    visit '/'
    expect(page).to(have_content('Admin'))
    expect(page).to(have_content('Events'))
    expect(page).to(have_content('Announcements'))
  end

  it 'Rainy Day - Logged out user cannot view admin/user pages' do
    visit '/'
    expect(page).not_to(have_content('Admin'))
    expect(page).not_to(have_content('Events'))
    expect(page).not_to(have_content('Announcements'))
  end

  it 'Standard User' do
    user.access_level = 0
    sign_in(user)
    visit '/'
    expect(page).not_to(have_content('Admin'))
    expect(page).to(have_content('Events'))
    expect(page).to(have_content('Announcements'))
  end
end
