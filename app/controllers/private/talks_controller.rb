# coding: utf-8
module Private
  class TalksController < ApplicationController  
    before_filter :login_authenticate  
    def index
      @search = params[:search] || 'hosted'
      page = params[:page] ? params[:page].to_i : 1

      if @search == 'hosted'
        talks = []
      else
        talks = Talk.where(user_id: current_user.id).to_a
      end
      @talks = Kaminari.paginate_array(talks).page(page).per(Talk::PER_PAGE)
      if page == 1
        @next = Kaminari.paginate_array(talks).page(page + 1).per(Talk::PER_PAGE).count > 0
      else
        render 'talks/_list', layout: false, locals: { talks: @talks}
      end
    end
  end
end