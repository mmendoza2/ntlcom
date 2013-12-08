class RelationmicrositiosController < ApplicationController
  before_filter :authenticate_user!

  def create
    @micrositio = Micrositio.find(params[:relationmicrositio][:followed_id])
    current_user.followmicrositio!(@micrositio)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end

  end

  def destroy
    @micrositio = Relationmicrositio.find(params[:id]).followed
    current_user.unfollowmicrositio!(@micrositio)
    respond_to do |format|
      format.html { redirect_to(:back)}
      format.js
    end

  end

end