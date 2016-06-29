class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
    @bookmarks = policy_scope(Bookmark)
    @likes = policy_scope(Like)


  end
end
