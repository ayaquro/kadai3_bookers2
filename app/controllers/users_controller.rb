class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
  end

  def update
    user_id = params[:id].to_i
    unless user_id == current_user
    redirect_to user_path(current_user)
    end
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end


end