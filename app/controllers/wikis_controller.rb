class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
    #authorize @wikis
  end

  def show
    @user = current_user
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))
    @wiki.user = current_user
    authorize @wiki
     if @wiki.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :new
     end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
     if @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :private))
       flash[:notice] = "wiki was updated."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :edit
     end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

   def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
   end
end

