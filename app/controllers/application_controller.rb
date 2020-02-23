class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters

    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me,:first_name,:last_name,:mobile_number]

    ## To permit attributes while registration i.e. sign up (app/views/devise/registrations/new.html.erb)
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)

    devise_parameter_sanitizer.permit(:sign_in,
    keys: [:login, :password, :password_confirmation])
  
    ## To permit attributes while editing a registration (app/views/devise/registrations/edit.html.erb)
    devise_parameter_sanitizer.permit( :account_update, keys: added_attrs )
  end


end
