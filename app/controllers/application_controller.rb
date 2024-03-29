class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper # include the sessions helper module

  before_filter :authorize

  def authorize
      redirect_to new_session_path unless current_user
  end
end
