module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token # stores cookie for up to 20 days
  end

  def sign_out
    cookies.delete(:remember_token) # delete the remember token key and value but keep the cookies hash
  end

  def current_user
    # if there is a current user already that is returned or it stores the new user (so you dont have to keep making calls to the database)
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

end
