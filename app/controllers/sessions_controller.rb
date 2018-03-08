class SessionsController < Devise::SessionsController

  before_action :authenticate_user!

  def dashboard
    authorize(User)
    @wikis = WikiPolicy::Scope.new(current_user, Wiki).dashboard_scope
  end

  def downgrade
    authorize(User)
    current_user.standard!
    current_user.wikis.each do |wiki|
      wiki.private = false
      wiki.save!
    end
    flash[:notice] = "Your account has been downgraded back to standard. Feel free to upgrade again in the future!"
    redirect_to users_dashboard_path
  end

end
