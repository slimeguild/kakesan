# coding: utf-8
class SessionsController < ApplicationController  
  def new
    render :controller => "themes", :action => "new"
  end

  def check
    render json: {status: signed_in?}
  end

end