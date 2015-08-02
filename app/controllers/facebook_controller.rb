class FacebookController < ApplicationController
  def token
    render plain: Facebook.profile(params[:token])
  end
end
