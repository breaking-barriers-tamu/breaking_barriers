# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def update
      super do |resource|
        resource.update(registration_completed: true) if resource.valid?
        if resource.errors.any?
          flash[:alert] = resource.errors.full_messages.join("\n")
        else
          flash[:notice] = 'Profile updated successfully'
        end 
        redirect_to edit_user_registration_path and return if resource.persisted?
      end
    end

    private

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :major, :year, :phone_number,
                                   :access_level
      )
    end
  end
end
