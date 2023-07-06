class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :show, :index]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  def edit
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to user_path(current_user)
  end
    @user = User.find(params[:id])
  end
  def update
  user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to user_path(current_user)
  end
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
  else
    render :edit
  end
  end

  def user_params
  params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end
