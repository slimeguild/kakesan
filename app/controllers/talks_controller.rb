# coding: utf-8
class TalksController < ApplicationController
  before_filter :login_authenticate, only: [:create, :show]
  def create
    @talk = Talk.new(params[:talk])
    if @talk.save
      redirect_to talk_path(@talk)
    else
      @theme = @talk.theme
      render 'themes/show'
    end 
  end

  def show
    @talk = Talk.find(params[:id])
    @chat = Chat.new({talk_id: @talk.id, user_id: current_user.id})
  end
end