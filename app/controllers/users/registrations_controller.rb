class Users::RegistrationsController < Devise::RegistrationsController
  def update
    super do |resource|
      resource.update(registration_completed: true) if resource.valid?
    end
  end
  private

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :major, :year, :phone_number, :access_level)
  end
end
