class InvitationsController < Devise::InvitationsController
  def create # this method is called when the user clicks the button invite
    authorize current_user
    super
  end
end
