class CollaboratorsController < ApplicationController

  def create
    #user = User.find(params[:collaborator])
    user = User.find_by(email: params[:email])
    wiki = Wiki.find(params[:wiki_id])

   #@collaborator = Collaborator.new(user: user, wiki: wiki)
    if wiki.users.include?(user) 
    flash[:notice] = "#{user.email} is already a Collaborator."
    elsif user && Collaborator.create(user: user, wiki: wiki)
      flash[:notice] = "#{user.email} was added as a collaborator"
    elsif user.nil?
      flash[:error] = "#{params[:email]} is not an active user."   
    else
      flash[:error] = "There was an error saving the collaborator. Please try again."
    end
    redirect_to edit_wiki_path(wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
      if @collaborator.destroy
        flash[:notice] = "Collaborator was deleted successfully."
        redirect_to wiki_path(wiki.id)
      else
        flash[:error] = "There was an error deleting the collaborator."
        render :show
      end
  end

end # can we go to your terminal?