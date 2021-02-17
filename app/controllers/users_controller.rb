class UsersController < ApplicationController
  before_action :move_to_user, only: [:edit, :destroy]
  before_action :authenticate_user!, only: [:edit, :destroy]

  def show
    @user = User.find(params[:id])
    @post = @user.posts
    @post_like = @user.post_likes
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @post = @user.posts
    @post_like = @user.post_likes
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "devise/registrations/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
    else
      render :show
    end
  end



  private

  def user_params
    params.fetch(:user, {}).permit(:nickname, :profile, :email, :image)
  end


  def move_to_user
    @user = User.find(params[:id])
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
  end
end
