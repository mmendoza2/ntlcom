class ActividadespadreController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_actividadpadre, only: [:show, :edit, :update, :destroy]

  # GET /actividades
  # GET /actividades.json
  def index
    @actividadespadre = Actividadpadre.all
  end

  # GET /actividades/1
  # GET /actividades/1.json
  def show
  end

  # GET /actividades/new
  def new
    @actividadpadre = Actividadpadre.friendly.find(params[:id])
  end

  # GET /actividades/1/edit
  def edit
    @actividadpadre = Actividadpadre.friendly.find(params[:id])

  end

  # POST /actividades
  # POST /actividades.json
  def create
    @actividadpadre = Actividadpadre.new(actividadpadre_params)

    respond_to do |format|
      if @actividadpadre.save
        format.html { redirect_to @actividadpadre, notice: 'Actividad was successfully created.' }
        format.json { render action: 'show', status: :created, location: @actividadpadre }
      else
        format.html { render action: 'new' }
        format.json { render json: @actividadpadre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividades/1
  # PATCH/PUT /actividades/1.json
  def update
    @actividadpadre = Actividadpadre.friendly.find(params[:id])

    respond_to do |format|
      if @actividadpadre.update(actividadpadre_params)
        format.html { redirect_to @actividadpadre, notice: 'Actividad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @actividadpadre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividades/1
  # DELETE /actividades/1.json
  def destroy
    @actividadpadre.destroy
    respond_to do |format|
      format.html { redirect_to actividadespadre_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividadpadre
      @actividadpadre = Actividadpadre.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividadpadre_params
      params[:actividadpadre].permit(:actividadpadre, :photo, :descripcion)
    end
end
