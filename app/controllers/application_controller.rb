class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:media])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:media])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
  
    private

  def is_admin?
  if current_user.nil? || !current_user.admin?
       head(:forbidden)
        false
  end
  end
  
  def word_count
    body.split.size
  end
  
  def reading_time
    (word_count / 200.0).ceil
  end
end
