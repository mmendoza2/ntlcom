class MicrositiosController < ApplicationController
  before_filter :authenticate_user!
  before_action :correct_user,   only: :destroy
  before_action :set_micrositio, only: [:show, :edit, :update, :destroy]





  # GET /micrositios
  # GET /micrositios.json
  def index


    @micrositios = Micrositio.order(:name).where("name like ?", "#{params[:term]}")
    render json: @micrositios.map(&:name)
  end

  # GET /micrositios/1
  # GET /micrositios/1.json
  def show
    @micrositios = Micrositio.all
    @micrositio = Micrositio.friendly.find(params[:id])
    @user = Micrositio.friendly.find(params[:id])
  end

  # GET /micrositios/new
  def new
    @micrositio = Micrositio.new
    @estados = Estado.all

  end

  # GET /micrositios/1/edit
  def edit
  end

  # POST /micrositios
  # POST /micrositios.json
  def create
    @micrositio = current_user.micrositios.build(micrositio_params)
    respond_to do |format|
      if @micrositio.save
        format.html { redirect_to @micrositio, notice: '¡El Micrositio fue creado exitosamente!.' }
        format.json { render action: 'show', status: :created, location: @micrositio }
      else
        format.html { render action: 'new' }
        format.json { render json: @micrositio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /micrositios/1
  # PATCH/PUT /micrositios/1.json
  def update
    respond_to do |format|
      if @micrositio.update(micrositio_params)
        format.html { redirect_to @micrositio, notice: 'Micrositio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @micrositio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /micrositios/1
  # DELETE /micrositios/1.json
  def destroy
    @micrositio.destroy
    respond_to do |format|
      format.html { redirect_to micrositios_url }
      format.json { head :no_content }
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micrositio
      @micrositio = Micrositio.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micrositio_params
      params.require(:micrositio).permit(:name,  :descripcion, :photo)
    end



end

