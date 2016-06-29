class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
    @bookmarks = policy_scope(Bookmark)

    @likes_bookmarks = current_user.likes.collect(&:bookmark)

  end
end
