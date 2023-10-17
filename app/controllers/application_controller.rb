# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_registration_completion, unless: :devise_controller?

  private

  def check_registration_completion
    if user_signed_in? && !current_user.registration_completed?
      sign_out(current_user)
      redirect_to(new_user_session_path,
                  alert: 'Please complete your registration before proceeding.'
                 )
    end
  end
end
