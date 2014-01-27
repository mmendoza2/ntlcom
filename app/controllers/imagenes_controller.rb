class ImagenesController < ApplicationController
  before_filter :authenticate_user!
  before_action :admin_user,     only: :destroy

  # GET /eventos
  # GET /eventos.json
  def index
    @imagen = Imagen.all
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @imagen = Imagen.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @imagen = current_user.imagen.build(imagen_params)
    respond_to do |format|
      if @imagen.save
        format.html { redirect_to @imagen, notice: 'Evento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @imagen }
      else
        format.html { render action: 'new' }
        format.json { render json: @imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @imagen.update(imagen_params)
        format.html { redirect_to @imagen, notice: 'Evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @imagen.destroy
    respond_to do |format|
      format.html { redirect_to imagen_url }
      format.json { head :no_content }
    end
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_imagen
    @imagen = Imagen.friendly.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imagen_params
      params[:imagen].permit(:name)
    end




end
