class RestroomPolicy < ApplicationPolicy
  attr_reader :user, :restroom

  def initialize(user, post)
    @user = user
    @restroom = restroom
  end

  def create?
    true
  end

  def newprelim?
    user.present?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

