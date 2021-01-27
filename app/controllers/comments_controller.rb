class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      @post = @comment.post
      @comments = @prototype.post
      render "prototypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

