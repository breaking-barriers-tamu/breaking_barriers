class Users::SessionsController < Devise::SessionsController
  def destroy
    puts "devise_mapping: #{devise_mapping.inspect}"
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    redirect_to root_path
  end
end
