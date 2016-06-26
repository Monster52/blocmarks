class BookmarksController < ApplicationController

  before_filter :authenticate_user!

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user_id = current_user.id
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark saved."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "Error saving bookmark."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was updated successfully."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "There was an error updateing the Bookmark.  Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully"
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error deleting this bookmark.  Please try again."
      redirect_to :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
