class RegistrationsController < Devise::RegistrationsController
 http_basic_authenticate_with name: "admin",  password: "pa$$word", only: [:sign_up]
def sign_up_params
  devise_parameter_sanitizer.sanitize(:sign_up)
end

def account_update_params
  devise_parameter_sanitizer.sanitize(:account_update)
end

  private

 def sign_up_params
   params.require(:user).permit(:first_name, :last_name, :admin, :super_admin,:email, :password, :password_confirmation)
 end

 def account_update_params
   params.require(:user).permit(:first_name, :last_name, :email, :admin, :super_admin,:password, :password_confirmation, :current_password)
 end
end
