class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  
  def index
    @post = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comment_like = @post.comments.includes(:likes).sort {|a,b| b.likes.size <=> a.likes.size}
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end


  def destroy
    if @post.destroy
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :genre_id, :sentence, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end