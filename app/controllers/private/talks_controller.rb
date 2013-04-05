# coding: utf-8
module Private
  class TalksController < ApplicationController  
    before_filter :login_authenticate  
    def index
      @search = params[:search] || 'hosted'
      page = params[:page] ? params[:page].to_i : 1

      if @search == 'hosted'
        talks = current_user.hosted_talks
      else
        talks = Talk.entried_by(current_user)
      end
      @talks = Kaminari.paginate_array(talks).page(page).per(Talk::PER_PAGE)
      if page == 1
        @next = Kaminari.paginate_array(talks).page(page + 1).per(Talk::PER_PAGE).count > 0
      else
        render 'talks/_list', layout: false, locals: {talks: @talks, hosted: @search == 'hosted'}
      end
    end
  end
end