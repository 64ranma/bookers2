class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = current_user
    @book = Book.new
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] ="You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end

end
