class UsersController < ApplicationController  
  def show
    @user = User.find(params[:id])
    @post = @user.posts
    @post_like = @user.post_likes
  end

end
