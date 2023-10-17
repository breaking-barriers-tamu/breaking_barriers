# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(EventConfirmationMailer, type: :mailer) do
  describe 'confirmation' do
    let(:user) { create(:user, first_name: 'first_name_1', last_name: 'last_name_1', access_level: 1, registration_completed: true) }
    let(:event) { create(:event, name: 'Event 1', datetime: '2023-12-31 05:30 PM', location: 'Event Location') }
    let(:event_log1) { create(:event_log, event_id: event.id, user_id: user.id, participating: true) }
    let(:mail) { described_class.with(user: user, event: event).confirmation_email }

    it 'renders the headers' do
      expect(mail.subject).to(have_content('[Breaking Barriers]'))
      expect(mail.from).to(eq(['breaking.barriers.tamu.mailer@gmail.com']))
    end

    it 'renders the body' do
      expect(mail.body.encoded).to(have_content('Thanks for volunteering'))
    end
  end
end
