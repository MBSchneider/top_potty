class RestroomPolicy < ApplicationPolicy
  attr_reader :user, :restroom

  def initialize(user, post)
    @user = user
    @restroom = restroom
  end

  def create?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def update?
    if user
      user.admin?
    else
      false
    end
  end

  def destroy?
    if user
      user.admin?
    else
      false
    end
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

