class UsersController < ApplicationController
  before_action :set_user
  before_action :move_to_user, only: [:edit, :destroy]
  before_action :authenticate_user!, only: [:edit, :destroy]

  def show
    @post = @user.posts
    @post_like = @user.post_likes
  end


  def edit
  end

  def update
    @post = @user.posts
    @post_like = @user.post_likes
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "devise/registrations/edit"
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render :show
    end
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:nickname, :profile, :email, :image)
  end


  def move_to_user
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
  end
end
