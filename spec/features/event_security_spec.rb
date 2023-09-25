require 'rails_helper'

RSpec.describe "Event Security", type: :feature do
    let!(:user) { create(:user, access_level: 0, registration_completed: true) }
    let!(:event) { create(:event, name: 'Existing Event', date: '2023-12-31', time: '05:30 PM', location: 'Event Location', duration: 1.0) }
    it "Does not allow non-registered users to access events" do
        visit events_path
        expect(page).to have_content("You need to sign in or sign up before continuing.")
    end

    it "Does not allow non-admins to create events" do
        sign_in(user)
        visit new_event_path
        expect(page).to have_content("You do not have permission to perform this action.")
    end

    it "Does not allow non-admins to edit events" do
        sign_in(user)
        visit edit_event_path(event.id)
        expect(page).to have_content("You do not have permission to perform this action.")
    end

end