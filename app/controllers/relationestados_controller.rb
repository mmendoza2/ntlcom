class RelationestadosController < ApplicationController
  before_filter :authenticate_user!

  def create
    @estado = Estado.find(params[:relationestado][:followed_id])
    current_user.followestado!(@estado)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end

  end

  def destroy
    @estado = Relationestado.find(params[:id]).followed
    current_user.unfollowestado!(@estado)
    respond_to do |format|
      format.html { redirect_to(:back)}
      format.js
    end

  end

end