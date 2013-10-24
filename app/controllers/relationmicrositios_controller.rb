class RelationmicrositiosController < ApplicationController
  before_action :signed_in_user

  def create
    @micrositio = Micrositio.find(params[:relationmicrositio][:followed_id])
    current_user.followmicrositio!(@micrositio)
    respond_to do |format|
      format.html { redirect_to @micrositio }
      format.js
    end

  end

  def destroy
    @micrositio = Relationmicrositio.find(params[:id]).followed
    current_user.unfollowmicrositio!(@micrositio)
    respond_to do |format|
      format.html { redirect_to @micrositio }
      format.js
    end

  end

end