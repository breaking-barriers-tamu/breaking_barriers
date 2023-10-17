# frozen_string_literal: true

require 'rails_helper'

describe 'Announcement CRUD', type: :feature do
  let!(:user) { create(:user, first_name: 'first', last_name: 'last', access_level: 1, registration_completed: true) }
  let!(:announcement) { create(:announcement, title: 'Existing Announcement', body: 'This is the body of the announcement.') }

  # --- Announcement Creation ---
  it 'Create an announcement - Sunny' do
    sign_in(user)
    visit new_announcement_path
    puts page.html

    fill_in 'announcement[title]', with: 'New Announcement'
    find('.trix-content').set('This is the annoucment body')

    click_on 'Create Announcement'
    expect(page).to(have_content('Announcement was successfully created.'))
  end

  it 'Create an announcement - Rainy' do
    sign_in(user)
    visit new_announcement_path

    fill_in 'announcement[title]', with: ''
    find('.trix-content').set('This is the annoucment body')

    click_on 'Create Announcement'
    expect(page).to(have_content("Title can't be blank"))
  end

  # --- Showing Announcement ---
  # it 'Show an announcement' do
  #   sign_in(user)
  #   visit announcement_path(announcement)

  #   expect(page).to(have_content('Existing Announcement'))
  #   expect(page).to(have_content('This is the body of the announcement.'))

  #   # Generate times for the range
  #   current_utc_time = Time.now.utc -  1.minutes
  #   tol_utc_time = current_utc_time + 5.minutes

  #   timestamp_string = page.body.match(/([A-Z][a-z]+ \d{2}, \d{4} at \d{1,2}:\d{2} (AM|PM))/)[0]

  #   timestamp_time = DateTime.strptime(timestamp_string, '%B %d, %Y at %I:%M %p').utc
  #   expect(timestamp_time).to be_between(current_utc_time, tol_utc_time)
  # end

  # --- Updating Announcement ---
  it 'Edit an announcement - Sunny' do
    sign_in(user)
    visit edit_announcement_path(announcement)

    fill_in 'announcement[title]', with: 'Updated Announcement Title'
    find('.trix-content').set('This is the updated body of the announcement.')

    click_on 'Update Announcement'
    expect(page).to(have_content('Announcement was successfully updated.'))
  end

  it 'Edit an announcement - Rainy' do
    sign_in(user)
    visit edit_announcement_path(announcement)

    fill_in 'announcement[title]', with: ''
    find('.trix-content').set('This announcement is missing its title.')

    click_on 'Update Announcement'
    expect(page).to(have_content("Title can't be blank"))
  end

  # --- Destroying Announcement ---
  # scenario 'Delete an announcement with confirmation' do
  #   page.execute_script("alert('Hello from JavaScript!')")
  #   puts Capybara.current_driver

  #   sign_in(user)
  #   visit announcement_path(announcement)
  #   puts page.html
  #   click_button 'Delete'
  #   sleep 1
  #   page.accept_alert 'Are you sure?'
  #   expect(page).not_to have_content(announcement.title)
  # end
end
