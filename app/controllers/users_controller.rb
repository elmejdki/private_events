class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end  

  def destroy
    @user =  User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def sign_in
    @user = User.new
  end

  def sign_in_action
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
