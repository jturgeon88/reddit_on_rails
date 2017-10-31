class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_methods :logged_in?, :current_user

  def log_in(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end 

  def log_out!
    if logged_in?
      current_user.reset_session_token!
      session[:session_token] = nil
    else 
      redirect_to new_session_url
    end
  end 

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end

end
