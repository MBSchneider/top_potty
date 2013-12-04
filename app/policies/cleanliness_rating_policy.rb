class RestroomPolicy < ApplicationPolicy
  attr_reader :user, :cleanliness_rating

  def initialize(user, cleanliness_rating)
    @user = user
    @cleanliness_rating = cleanliness_rating
  end

  def create?
    true
  end

  def newprelim?
    user.present?
  end

  def new?
    user.present?
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

