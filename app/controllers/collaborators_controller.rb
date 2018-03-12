class CollaboratorsController < ApplicationController
  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:collaborator][:email])
    @collaborator = @wiki.collaborators.new(collaborator_params)
    if Collaborator.check(@wiki, @user)
      flash[:alert] = "Collaborator already exists"
    else
      @collaborator.user = @user
    end

    if @collaborator.save
      flash[:notice] = "Successfully added collaborator"
      redirect_to @wiki
    else
      flash[:alert] ||= "Failed to add collaborator"
      redirect_to @wiki
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Successfully deleted collaborator"
      redirect_to users_dashboard_path
    else
      flash[:alert] = "Collaborator could not be deleted"
      redirect_to users_dashboard_path
    end
  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:email)
  end
end
