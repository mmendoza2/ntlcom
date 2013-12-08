class RelationactividadesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @actividad = Actividad.find(params[:relationactividad][:followed_id])
    current_user.followactividad!(@actividad)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end

  end

  def destroy
    @actividad = Relationactividad.find(params[:id]).followed
    current_user.unfollowactividad!(@actividad)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end

  end

end