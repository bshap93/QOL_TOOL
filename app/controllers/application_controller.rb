class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id] != nil
      return User.find(session[:user_id])
    else
      return nil
    end
  end

  def user_signed_in?
    current_user != nil
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end
end
