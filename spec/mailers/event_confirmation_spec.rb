# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(EventConfirmationMailer, type: :mailer) do
  describe 'confirmation' do
    let(:user) { create(:user, phone_number: '(214) 123 - 4567', first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }
    let(:event) { create(:event, name: 'Event 1', datetime: '2029-12-31 05:30 PM', location: 'Event Location', duration: 1) }
    let(:event_log1) { create(:event_log, event_id: event.id, user_id: user.id, participating: true) }
    let(:mail) { described_class.with(user: user, event: event).confirmation_email }

    it 'renders the headers' do
      expect(mail.subject).to(have_content('[Breaking Barriers]'))
      expect(mail.from).to(eq(['breaking.barriers.tamu.mailer@gmail.com']))
    end

    it 'renders the body' do
      expect(mail.body.encoded).to(have_content('Your sign-up for Event 1 on 12/31/2029 has been confirmed!'));
      expect(mail.body.encoded).to(have_content('The event will take place at Event Location at 05:30 pm.'));
      expect(mail.body.encoded).to(have_content('You will receive 1.0 service hours for participating.'));
    end
  end
end
