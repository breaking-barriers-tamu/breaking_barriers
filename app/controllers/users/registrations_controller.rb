# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def update
      super do |resource|
        if resource.errors.empty?
          resource.update(registration_completed: true)
          flash[:notice] = 'Registration Completed'
          redirect_to(root_path) and return
        else
          flash[:alert] = resource.errors.full_messages.join("\n")
        end
      end
    end

    protected

    def update_resource(resource, params)
      if resource.provider == 'google_oauth2'
        resource.update_without_password(params)
      else
        resource.update_with_password(params)
      end
    end

    private

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :year, :phone_number,
                                   :access_level
      )
    end
  end
end
