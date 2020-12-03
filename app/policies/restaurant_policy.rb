class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  # def new?
  #   create?
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  # TRUE => DONO
  # FALSE => RESTO
  # if user == record.user
  #   true
  # else
  #   false
  # end
  # eh o mesmo que
  #   user == record.user
  # end

  def update?
    admin_or_owner?
  end

  def destroy?
    admin_or_owner?
  end

  private

  def admin_or_owner?
    user.admin || user == record.user
  end
end
