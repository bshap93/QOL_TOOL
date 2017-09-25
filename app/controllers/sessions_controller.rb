class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = auth['uid']
    end
    qol = Questionnaire.first
    user.questionnaires << qol
    user.save
    session[:user_id] = user.id
    redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end

  def create_manual
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


  def auth
    request.env['omniauth.auth']
  end


end
