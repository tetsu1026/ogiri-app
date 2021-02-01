class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @like = Like.create(user_id: current_user.id, post_id: @post.id, comment_id: @comment.id)
    redirect_to post_path(@comment.post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    Like.find_by(user_id: current_user.id, post_id: @post.id, comment_id: @comment.id).destroy
    redirect_to post_path(@comment.post)
  end
end
