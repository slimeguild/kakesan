class IosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :login_authenticate
  def create
    iOS = current_user.iOS
    iOS.update_attribute(:token, params[:token])
    render json: {status: true}
  end
end