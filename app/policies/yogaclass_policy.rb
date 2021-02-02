class YogaclassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true if @user.user_type == "Teacher"
  end

  def show?
    true
  end

  # Uncomment these methods below if we have added update/edit options.
  # add 'authorize @yogaclass' to the controller methods
  # edit views accordingly

  # def update?
  #   user_is_owner_or_admin?
  # end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
