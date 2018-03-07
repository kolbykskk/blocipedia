class WikiPolicy < ApplicationPolicy
  def destroy?
    record.user == user or user.try(:admin?)
  end

  def index?
    true
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def show?
    true
  end

  def update?
    user.present?
  end

  class Scope
  attr_reader :user, :scope

  def initialize(user, scope)
    @user = user
    @scope = scope
  end

  def resolve
    if @user
      return @scope.all
    else
      return @scope.none
    end
  end
end
end
