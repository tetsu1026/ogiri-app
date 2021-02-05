class PostLikesController < ApplicationController
  
  def create
    
    @post = Post.find(params[:post_id])
    @post_like = PostLike.create(user_id: current_user.id, post_id: @post.id)
    redirect_to root_path(@post)
    
  end

  def destroy
    @post = Post.find(params[:post_id])
    PostLike.find_by(user_id: current_user.id, post_id: @post.id).destroy
    redirect_to root_path
  end
end
