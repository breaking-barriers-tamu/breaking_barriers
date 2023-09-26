=begin
require 'rails_helper'

feature "Participants List", type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 2, registration_completed: true) }
  let!(:event) { create(:event, name: 'Event 1', date: '2001-12-31', time: '15:30:00', location: 'Event Location') }
  let!(:event_log1) { create(:event_log, event_id: event.id, user_id: user.id, participating: true) }

  before do
    sign_in(user)
    visit admin_event_path(event)
  end

  scenario "admin can change participation status" do
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content("Participating")

    within("#event_log_#{event_log1.id}") do
      select "Not Participating", from: "participation_status_#{user.id}"
      click_button "Confirm Changes"
    end

    expect(page).to have_content("Not Participating")
  end
end
=end
