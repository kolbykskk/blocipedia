class SessionsController < Devise::SessionsController

  before_action :authenticate_user!

  def dashboard
    authorize(User)
    @wikis = current_user.wikis
  end

  def downgrade
    authorize(User)
    current_user.standard!
    flash[:notice] = "Your account has been downgraded back to standard. Feel free to upgrade again in the future!"
    redirect_to users_dashboard_path
  end

end
