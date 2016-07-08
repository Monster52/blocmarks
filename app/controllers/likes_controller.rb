class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.friendly.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)

    if @like.save
      flash[:notice] = "Bookmark liked."
      redirect_to [@bookmark.topic]
    else
      flash.now[:alert] = "Error living bookmark."
      redirect_to [@bookmark.topic]
    end
  end

  def destroy
    @bookmark = Bookmark.friendly.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])

    if @like.destroy
      flash[:notice] = "\"#{@bookmark.url}\" unliked"
      redirect_to [@bookmark.topic]
    else
      flash.now[:alert] = "There was an error liking this bookmark.  Please try again."
      redirect_to [@bookmark.topic]
    end
  end

end
