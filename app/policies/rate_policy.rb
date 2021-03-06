class RatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user || user.role == 'Admin' || user.role == 'Back-Office'
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
