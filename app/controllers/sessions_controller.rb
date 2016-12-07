class SessionsController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    redirect_to controller: 'welcome', action: 'index'
  end


  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
