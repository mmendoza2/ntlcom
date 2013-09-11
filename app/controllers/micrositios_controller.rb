class MicrositiosController < ApplicationController
  before_action :set_micrositio, only: [:show, :edit, :update, :destroy]

  # GET /micrositios
  # GET /micrositios.json
  def index
    @micrositios = Micrositio.all
  end

  # GET /micrositios/1
  # GET /micrositios/1.json
  def show
  end

  # GET /micrositios/new
  def new
    @micrositio = Micrositio.new
  end

  # GET /micrositios/1/edit
  def edit
  end

  # POST /micrositios
  # POST /micrositios.json
  def create
    @micrositio = Micrositio.new(micrositio_params)
    respond_to do |format|
      if @micrositio.save
        format.html { redirect_to @micrositio, notice: 'Micrositio was successfully created.' }
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

  def has_attached_file
  end

  def photo
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micrositio
      @micrositio = Micrositio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micrositio_params
      params.require(:micrositio).permit(:name, :descripcion, :photo)
    end
end
