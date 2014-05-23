module SessionsHelper

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def ensure_logged_out
    redirect_to "#/users/#{current_user.id}" if logged_in?
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end
end
