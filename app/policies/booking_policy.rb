class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    my_own?
  end

  def update?
    my_own?
  end

  def destroy?
    my_own?
  end

  private
  def my_own?
    record.user == user
  end
end
