# coding: utf-8
class AuthentificationsController < ApplicationController  
  def callback
    auth = env['omniauth.auth']
    if authorization = Twitter.find_by_account_id(auth['uid'])
      self.current_user = authorization.user
    else
      user = User.new({
        name: auth['info']['name'],
        nickname: auth['info']['nickname'],
        image: auth['info']['image']
      })
      user.build_twitter(
        account_id: auth['uid']
      )
      user.save
      self.current_user = user
    end
    request.session_options[:expire_after] = 1.months.from_now
    redirect_to root_path, notice: 'ログインしました。'
  end

  def failure
  end
end