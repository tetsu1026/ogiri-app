class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy, :update]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  
  def index
    @post = Post.includes(:user).order("created_at DESC")
    @post_like = Post.includes(:post_likes).sort {|a,b| b.post_likes.size <=> a.post_likes.size}
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

  def indexabout
  end

  private

  def post_params
    params.require(:post).permit(:title, :genre_id, :sentence, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @post.user_id
      redirect_to action: :index
    end
  end
end