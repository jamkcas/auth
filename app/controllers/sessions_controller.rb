class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create] # will skip the authorize filter if new and create

  def new

  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password]) # bcrypt encrypts the password and see if it matches to the user encrypted password
      # cookies[:remember_token] = user.remember_token # only stores session for length the browser is open
      sign_in(user) # uses SessionsHelpers module
      # cookies is a hash built into ruby, so we are setting a key :remember_token to the user.remember_token
      redirect_to user_path(user.id)
    else
      flash[:errors] = 'Errors'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

end
