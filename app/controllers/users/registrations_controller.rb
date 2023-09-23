class Users::RegistrationsController < Devise::RegistrationsController
  def update
    super do |resource|
      resource.update(registration_completed: true) if resource.valid?
    end
  end
end
