# coding: utf-8
class UsersController < ApplicationController
  before_filter :login_authenticate, only: [:show]
  def show
    @user = User.find(params[:id])
  end
end