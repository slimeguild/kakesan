# coding: utf-8
module Private
  class ThemesController < ApplicationController  
    before_filter :login_authenticate  
    def index
      @search = params[:search] || 'hosted'
      page = params[:page] ? params[:page].to_i : 1

      if @search == 'hosted'
        themes = current_user.themes.newly.to_a
      else
        themes = current_user.entried_themes
      end
      @themes = Kaminari.paginate_array(themes).page(page).per(Theme::PER_PAGE)
      if page == 1
        @next = Kaminari.paginate_array(themes).page(page + 1).per(Theme::PER_PAGE).count > 0
      else
        render 'themes/_list', layout: false, locals: { themes: @themes}
      end
    end
  end
end