class ApplicationController < ActionController::Base
  # Invoke the `configure_permitted_parameters` method before any Devise controller action
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Configure permitted parameters for Devise controllers
  def configure_permitted_parameters
    # Permit the 'first_name' and 'last_name' attributes for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # Permit additional attributes ('first_name', 'last_name', 'bio', 'avatar', 'cover_photo') for account update
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :bio, :avatar, :cover_photo])
  end
end
