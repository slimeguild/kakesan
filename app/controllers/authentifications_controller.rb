# coding: utf-8
class AuthentificationsController < ApplicationController  
  def callback
    auth = env['omniauth.auth']
    if authorization = Twitter.find_by_account_id(auth['uid'])
      user = authorization.user
      self.current_user = user
      request.session_options[:expire_after] = 1.months.from_now
      redirect_to login_ksapi
    else
      user = User.new({
        nickname: auth['info']['nickname'],
        twitter_image: auth['info']['image'],
        description: auth['info']['description']
      })
      user.build_twitter(
        account_id: auth['uid']
      )
      session[:user] = user
      redirect_to new_user_path
    end
  end

  def failure
    redirect_to root_path
  end
end