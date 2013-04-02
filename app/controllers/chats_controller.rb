# coding: utf-8
class ChatsController < ApplicationController
  before_filter :login_authenticate, only: [:create]
  def create
    @chat = Chat.new(params[:chat])
    if @chat.save
      redirect_to talk_path(@chat.talk)
    else
      @talk = @chat.talk
      render 'talks/show'
    end
  end
end