class WikiPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.premium? || user.admin?
        scope.all
      elsif user.standard?
        scope.where(private: "f")
      end
    end

    def dashboard_scope
      if user.premium? || user.admin?
        scope.where(user: user)
      elsif user.standard?
        scope.where(user: user, private: "f")
      end
    end
  end

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
    if user.standard? && record.private == true
      false
    else
      true
    end
  end

  def update?
    user.present?
  end
end
