require 'rails_helper'


describe 'Event Calendar Feature', type: :feature do
    let!(:event) {create(:event, name:'Sample Event', description: "Event Description", datetime: Time.zone.now, location: 'Somewhere', duration: 1.0) }
    let!(:user) { create(:user, phone_number: '(214) 123 - 4567', first_name: 'first', last_name: 'last', access_level: 0, registration_completed: true) }
    current_month = Date.today
    
    it 'Shows an event on the calendar' do
        sign_in(user)
        visit events_path

        expect(page).to(have_content('Sample Event'))
        expect(page).to(have_content(Time.zone.now.strftime("%I:%M %p")))
    end        
        
    it 'Highlights the current day' do
        sign_in(user)
        visit events_path

        expect(page).to(have_css('.calendar-today'))
    end
    
    it 'Shows the current month' do
        sign_in(user)
        visit events_path

        expect(page).to(have_content(current_month.strftime("%B %Y")))
    end

    it 'Navigates to the previous month' do
        sign_in(user)
        visit events_path

        prev_month = current_month.prev_month(1)
        find('.prev-link').click
        expect(page).to(have_content(prev_month.strftime("%B %Y")))

    end

    it 'Navigates to the next month' do
        sign_in(user)
        visit events_path

        next_month = current_month.next_month(1)
        find('.next-link').click
        expect(page).to(have_content(next_month.strftime("%B %Y")))
    end

end