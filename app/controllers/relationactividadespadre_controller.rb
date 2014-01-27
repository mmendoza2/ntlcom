class RelationactividadespadreController < ApplicationController
  before_filter :authenticate_user!

  def create
    @actividadpadre = Actividadpadre.find(params[:relationactividadpadre][:followed_id])
    current_user.followactividadpadre!(@actividadpadre)
    respond_to do |format|
      format.html { redirect_to(:back)}
      format.js
    end

  end

  def destroy
    @actividadpadre = Relationactividadpadre.find(params[:id]).followed
    current_user.unfollowactividadpadre!(@actividadpadre)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end

  end

end