class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]

  def index
    @users = User.all
  end

  def edit
  end

  def new
    @user = User.new
  end

  def update
    @user.update(user_params)
    flash[:notice] = "user info updated"
    redirect_to @user
  end

  def destroy
    @user.destroy(user_params)
    flash[:notice] = "User removed"
    redirect_to users_path
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to users_path
    else
      flash.now[:error] = "Something went wrong. Please try again"
      render 'new'
    end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :contact, :email)
  end
end
