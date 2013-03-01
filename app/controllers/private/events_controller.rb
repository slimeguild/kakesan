# coding: utf-8
module Private
  class EventsController < ApplicationController  
    before_filter :login_authenticate  
    def index
      @search = params[:search] || 'hosted'
      page = params[:page] ? params[:page].to_i : 1

      if @search == 'hosted'
        events = current_user.events.newly.to_a
      else
        events = current_user.entried_events
      end
      @events = Kaminari.paginate_array(events).page(page).per(Event::PER_PAGE)
      if page == 1
        @next = Kaminari.paginate_array(events).page(page + 1).per(Event::PER_PAGE).count > 0
      else
        render 'events/_list', layout: false, locals: { events: @events}
      end
    end
  end
end