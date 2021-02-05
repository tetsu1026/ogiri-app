class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @post = @user.posts
    
     #post_likes = PostLike.where(user_id: current_user.id).pluck(:post_id)
     #@post_like = Post.find(post_likes)
     #@post_like = PostLike.where(user_id: current_user.id)
     @post_like = @user.post_likes
    
  end
end
