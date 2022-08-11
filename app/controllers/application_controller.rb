class ApplicationController < ActionController::Base
  # before_action :log_in?
  def log_in?
    if current_user
      redirect_to root_path
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end
end
