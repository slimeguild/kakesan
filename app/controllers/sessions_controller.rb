# coding: utf-8
class SessionsController < ApplicationController  
  def new
    redirect_to login_ksapi
    #render :controller => "events", :action => "new"
  end

  def check
    render json: {status: signed_in?}
  end

end