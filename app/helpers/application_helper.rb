module ApplicationHelper

  def current_user
    begin
      return User.find(session[:user_id])
    rescue
      return nil
    end
  end

  def user_signed_in?
    current_user != nil
  end
end
