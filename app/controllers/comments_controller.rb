# coding: utf-8
class CommentsController < ApplicationController
  before_filter :login_authenticate, only: [:new, :create]
  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    redirect_to theme_path(@comment.theme)
  end
end