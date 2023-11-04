# frozen_string_literal: true

class EventConfirmationDenyMailer < ApplicationMailer
  default from: 'breaking.barriers.tamu.mailer@gmail.com'

  # analogous to a controller action for email.
  # See view corresponding to this method name in event_confirmation_mailer
  def confirmation_email
    @user = params[:user]
    @event = params[:event]
    mail(to: @user.email,
         subject: "[Breaking Barriers] Sorry, your sign up for #{@event.name} has been rejected!"
        )
  end
end
