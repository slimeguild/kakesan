# coding: utf-8
class EntriesController < ApplicationController
  before_filter :login_authenticate, only: [:new, :create]
  def create
    @entry = Entry.new(params[:entry])
    @entry.save
    redirect_to event_path(@entry.event)
  end
end