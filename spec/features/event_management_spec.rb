# require 'rails_helper'

# feature 'Event management', type: :feature do
#   let!(:event) { create(:event, name: 'Existing Event', date: '2023-12-31', time: '15:30:00', location: 'Event Location') }

#   scenario ':Destory an Event' do
#     visit event_path(event)
#     click_on 'Destroy this event'
#     expect(page).to have_content('Event was successfully destroyed.')
#   end

#   scenario 'edit event' do
#     visit event_path(event.id)
#     click_on 'Edit this event'


#     fill_in "event[name]", with: 'Updated Event Name'
#     fill_in "event[date]", with: '2024-01-01'
#     fill_in "event[time]", with: '16:30:00'
#     fill_in "event[location]", with: 'Updated Location'

#     click_on 'Update Event' 

#     expect(page).to have_content('Event was successfully updated.')
#   end

#   scenario 'create new event' do
#     visit new_event_path 

#     fill_in "event[name]", with: 'New Event'
#     fill_in "event[date]", with: '2024-01-01'
#     fill_in "event[time]", with: '15:30:00'
#     fill_in "event[location]", with: 'New Location'

#     click_on 'Create Event'

#     expect(page).to have_content('Event was successfully created.')
#   end

#   scenario 'view existing event' do
#     visit event_path(event.id) 

#     expect(page).to have_content('Existing Event')
#     expect(page).to have_content('2023-12-31')
#     expect(page).to have_content('15:30:00')
#     expect(page).to have_content('Event Location')
#   end
# end
