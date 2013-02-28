# coding: utf-8
class EventsController < ApplicationController  
  before_filter :login_authenticate, only: [:new, :create]
  
  def index
    page = params[:page] ? params[:page].to_i : 1
    @events = Event.newly.page(page).per(Event::PER_PAGE)
    if page == 1
      @next = Event.newly.page(page+1).per(Event::PER_PAGE).count > 0
    else
      render 'events/_list', layout: false, locals: { events: @events}
    end
  end

  def show
    @event = Event.find(params[:id])
    # unless current_user == @event.user
    #   @entry = Entry.find_by_user_id_and_event_id(current_user.id, @event.id) || Entry.new({event_id: @event.id, user_id: current_user.id})
    # end
    # if (current_user == @event.user) || @entry.persisted?
    @comment = Comment.new({event_id: @event.id, user_id: current_user.id})
    #end
  end

  def new
    @event = Event.new({user_id: current_user.id})
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to new_event_path, notice: 'イベントを作成しました。'
    else
      render :new
    end
  end
end