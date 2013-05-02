# coding: utf-8
class UsersController < ApplicationController
  before_filter :login_authenticate, except: [:new, :create]
  before_filter :princial_authenticate, only: [:edit, :update]
  
  def new
    @user = session[:user] || User.new
    @user.gender_id = Gender::MALE
  end

  def create
    @user = User.new(params[:user])
    @user.build_iOS
    if @user.save
      self.current_user = @user
      session.delete :user
      redirect_to login_ksapi
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

end