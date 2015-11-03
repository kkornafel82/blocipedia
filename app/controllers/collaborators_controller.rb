class CollaboratorsController < ApplicationController

  def create
   @collaborator = Collaborator.new(params.require(:collaborator).permit(:id))
    if @collaborator.save
    flash[:notice] = "Collaborator was saved."
    redirect_to wiki_path(wiki.id)
    else
     flash[:error] = "There was an error saving the collaborator. Please try again."
     render :new
    end
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

end