class WikiPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      wikis = []
      collaborators = []
      if user.try(:admin?)
        wikis = scope.all
      elsif user.try(:premium?)
        all_wikis = scope.all
        all_wikis.each do |wiki|
          wiki.collaborators.each do |collaborator| collaborators << collaborator.email end
          if wiki.private == false || wiki.user == user || collaborators.include?(user.email)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        collaborators = []
        all_wikis.each do |wiki|
          wiki.collaborators.each do |collaborator| collaborators << collaborator.email end
          if wiki.private == false || collaborators.include?(user.email)
            wikis << wiki
          end
        end
      end
      wikis
    end

    def dashboard_scope
      if user.try(:premium?) || user.try(:admin?)
        scope.where(user: user)
      elsif user.try(:standard?)
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
    collaborators = []
    record.collaborators.each do |collaborator| collaborators << collaborator.email end
    if user.try(:standard?) && record.private == true && collaborators.exclude?(user.email)
      false
    else
      true
    end
  end

  def update?
    user.present?
  end
end
