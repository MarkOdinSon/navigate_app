class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
       scope.all
    end
  end

  def create?
    user.admin? # only admin can invite a new users.
  end
end
