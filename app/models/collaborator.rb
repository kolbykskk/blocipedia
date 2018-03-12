class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :wiki

  def self.check(wiki, user)
    if Collaborator.find_by(wiki_id: wiki.id, user_id: user.id) != nil
      true
    elsif wiki.user == user
      true
    else
      false
    end
  end
end
