# coding: utf-8
class CommentsController < ApplicationController
  before_filter :login_authenticate, only: [:new, :create]
  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    redirect_to event_path(@comment.event)
  end
end