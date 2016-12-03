class SessionsController < ApplicationController

  def new
  end

  def create
    begin
      @user = User.find_by(name: params[:name])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    rescue NoMethodError
      flash[:error] = "Invalid email and password"
      redirect_to new_user_session_path
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
