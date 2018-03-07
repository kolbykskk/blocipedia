class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to do this!"
    if current_user
      redirect_back fallback_location: users_dashboard_path
    else
      redirect_to(new_user_session_path)
    end
  end

end
