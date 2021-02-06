class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true if @user.user_type == "Student"
  end

  def show?
    true
  end
end
