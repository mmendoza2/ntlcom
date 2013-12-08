class RelationeventosController < ApplicationController
  before_filter :authenticate_user!

  def create
    @evento = Evento.find(params[:relationevento][:followed_id])
    current_user.followevento!(@evento)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end

  end

  def destroy
    @evento = Relationevento.find(params[:id]).followed
    current_user.unfollowevento!(@evento)
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end

  end

end