class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?
  before_filter :set_user_session_expire_after

  private
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def signed_in?
    current_user.present?
  end

  def set_user_session_expire_after
    request.session_options[:expire_after] = 1.months.from_now
  end

end
