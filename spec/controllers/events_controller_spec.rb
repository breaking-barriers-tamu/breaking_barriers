# spec/controllers/events_controller_spec.rb
require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "POST /create" do
    it "does not create a new event when data is invalid" do
      expect {
        post :create, params: { event: { name: nil, date: '2023-12-31', time: '15:30:00', location: 'New Location' } }
      }.to_not change(Event, :count)

      expect(response).to render_template(:new)
    end
  end

  describe "PATCH /update" do
    let!(:event) { Event.create(name: 'Test Event', date: '2023-12-31', time: '15:30:00', location: 'Event Location') }

    it "does not update an event when data is invalid" do
      patch :update, params: { id: event.id, event: { name: nil } }
      expect(event.reload.name).to eq('Test Event')
      expect(response).to render_template(:edit)
    end
  end
end
