class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end
end
