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
    @attended_events = @user.attended_events.order('date asc')
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
    @user = User.find_by(username: user_params["username"])

    if @user.nil?
      redirect_to root_path, alert: 'Wrong Username, sorry you are not allowed to enter.'
    else
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You signed in successfully.'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
