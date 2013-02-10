# coding: utf-8
class EventsController < ApplicationController  
  before_filter :login_authenticate, only: [:new, :create]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new({user_id: current_user.id})
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to :back
    else
      render :new
    end
  end
end