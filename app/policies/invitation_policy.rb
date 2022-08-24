class InvitationPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.admin? # only admin can create an new invitation
  end
end