# coding: utf-8
class SessionsController < ApplicationController  
  def new
    render :controller => "events", :action => "new"
  end

  def check
    render json: {status: signed_in?}
  end

end