class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user = user.try(:authenticate, params[:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to controller: 'welcome', action: 'index'
  end


  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
