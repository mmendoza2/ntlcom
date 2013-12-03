class RelationactividadesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @actividad = Actividad.find(params[:relationactividad][:followed_id])
    current_user.followevento!(@actividad)
    respond_to do |format|
      format.html { redirect_to @actividad }
      format.js
    end

  end

  def destroy
    @actividad = Relationactividad.find(params[:id]).followed
    current_user.unfollowevento!(@actividad)
    respond_to do |format|
      format.html { redirect_to @actividad }
      format.js
    end

  end

end