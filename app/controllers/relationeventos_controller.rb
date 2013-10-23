class RelationeventosController < ApplicationController
  before_action :signed_in_user

  def create
    @user = User.find(params[:relationevento][:followed_id])
    current_user.followevento!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end

  end

  def destroy
    @user = Relationevento.find(params[:id]).followed
    current_user.unfollowevento!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end

  end

end