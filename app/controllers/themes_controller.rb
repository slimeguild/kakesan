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
    # unless current_user == @theme.user
    #   @entry = Entry.find_by_user_id_and_theme_id(current_user.id, @theme.id) || Entry.new({theme_id: @theme.id, user_id: current_user.id})
    # end
    # if (current_user == @theme.user) || @entry.persisted?
    @comment = Comment.new({theme_id: @theme.id, user_id: current_user.id})
    #end
  end

  def new
    @theme = Theme.new({user_id: current_user.id})
  end

  def create
    @theme = Theme.new(params[:theme])
    if @theme.save
      redirect_to new_theme_path, notice: 'イベントを作成しました。'
    else
      render :new
    end
  end
end