class SessionsController < Devise::SessionsController

  def dashboard
    authorize(User)
    @wikis = current_user.wikis
  end

end
