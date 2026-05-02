class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_blocked_user

  def check_blocked_user
    if current_user&.blocked?
      sign_out current_user
      redirect_to new_user_session_path, alert: "Your account is blocked."
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :academic_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :academic_id])
  end
end