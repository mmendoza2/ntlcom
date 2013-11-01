class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_back_or user

  end

  def destroy
    sign_out
    session[:user_id] = nil
    redirect_to root_url
  end

end

