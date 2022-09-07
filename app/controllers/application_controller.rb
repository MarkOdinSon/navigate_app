class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :except => ["/users/invitation/accept"]
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You don't have enough rights to access it."
    redirect_to(request.referrer || root_path)
  end
end
