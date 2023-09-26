require 'rails_helper'

feature "Participants List", type: :feature do
  let!(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }
  let!(:event) { create(:event, name: 'Event 1', date: '2001-12-31', time: '15:30:00', location: 'Event Location') }
  let!(:event_log1) { create(:event_log, event_id: event.id, user_id: user.id, participating: true) }

  before do
    sign_in(user)
    visit admin_event_path(event)
  end

  scenario "sunny day - click confirm correctly" do
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content("Participating")

    within(".edit_event_log") do
      select "Not Participating", from: "event_log[participating]"
      click_button "Confirm Changes"
    end

    visit admin_event_path(event)
    expect(page).to have_content("Not Participating")
  end

  scenario "rainy day - do not click confirm" do
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content("Participating")

    within(".edit_event_log") do
      select "Not Participating", from: "event_log[participating]"
    end

    visit admin_event_path(event)
    expect(page).to have_content("Participating")
  end
end