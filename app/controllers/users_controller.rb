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
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html {redirect_to respond_to root_path, notice: "Thank you for signing up!"}
      else
        format.html {render :new}
      end
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
