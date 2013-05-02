# coding: utf-8
class ChatsController < ApplicationController
  before_filter :login_authenticate, only: [:create]
  def create
    @chat = Chat.new(params[:chat])
    if @chat.save
      receiver = chat.user == chat.talk.user ? chat.talk.theme.user : chat.talk.user
      API::PushNotification.new(reciever).chat_received(@chat) if receiver.notificatable?
      redirect_to talk_path(@chat.talk)
    else
      @talk = @chat.talk
      render 'talks/show'
    end
  end
end