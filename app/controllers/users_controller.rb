class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新成功した場合の処理
      flash[:notice] = "You have updated users successfully."
      redirect_to user_path(@user.id)
    else
      # 更新失敗した場合の処理
      render 'edit'
    end
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
      redirect_to user_path(current_user)
    end
  end

end
