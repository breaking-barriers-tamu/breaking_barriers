# frozen_string_literal: true

require 'rails_helper'

describe 'File attachment feature', type: :feature do
  let!(:event) { create(:event, name: 'Existing Event', description: 'Event Description', datetime: '2023-12-31 05:30 PM', location: 'Event Location', duration: 1.0) }
  let!(:admin) { create(:user, first_name: 'first', last_name: 'last', access_level: 1, registration_completed: true) }

  it 'Shows when there is no flier attached' do
    sign_in(admin)
    visit event_path(event)

    expect(page).to(have_content('No Flier Attachment'))
  end

  it 'Allows admin to attach flier' do
    sign_in(admin)
    visit admin_event_path(event)
    click_link('Edit Event')
    attach_file('event[flier]', Rails.root.join('app/assets/images/home-cover.jpg').to_s, make_visible: true)
    find('#submit-button').click

    expect(page).to(have_content('Delete Flier'))
  end

  it 'Deletes a flier that has been attached' do
    sign_in(admin)
    visit admin_event_path(event)
    
    click_link('Edit Event')
    attach_file('event[flier]', Rails.root.join('app/assets/images/home-cover.jpg').to_s, make_visible: true)
    find('#submit-button').click

    expect(page).to(have_content('Delete Flier'))

    click_on 'Delete Flier'
    expect(page).to(have_content('Flier was successfully deleted.'))
    expect(page).to(have_content('No Flier Attachment'))
  end
end
