# coding: utf-8
class ThemesController < ApplicationController  
  before_filter :login_authenticate, only: [:new, :create]
  
  def index
    page = params[:page] ? params[:page].to_i : 1
    @themes = Theme.newly.page(page).per(Theme::PER_PAGE)
    if page == 1
      @next = Theme.newly.page(page+1).per(Theme::PER_PAGE).count > 0
    else
      render 'themes/_list', layout: false, locals: { themes: @themes}
    end
  end

  def show
    @theme = Theme.find(params[:id])
    unless @theme.user == current_user
      if talk = Talk.find_by_theme_id_and_user_id(@theme.id, current_user.id)
        redirect_to talk_path(talk)
      else
        @talk = Talk.new({theme_id: @theme.id, user_id: current_user.id})
        @talk.chats.build({user_id: current_user.id})
      end
    end
  end

  def new
    @theme = Theme.new({user_id: current_user.id})
    @theme.build_requirements
  end

  def create
    @theme = Theme.new(params[:theme])
    if @theme.save
      redirect_to new_theme_path, notice: 'テーマを作成しました。'
    else
      render :new
    end
  end
end