class EstadosController < ApplicationController
  before_filter :authenticate_user!
  before_action :admin_user,     only: :destroy


  # GET /estados
  # GET /estados.json
  def index
    @estados = Estado.all
    @micrositios = Micrositio.all
    @eventos = Evento.all
    @estadosalf = Estado.order("estado")
    @estado = Estado.all
    @estadosfollow = Relationestado.all


  end

  # GET /estados/1
  # GET /estados/1.json
  def show
    @eventos = Evento.all
    @micrositios = Micrositio.all
    @estados = Estado.all
    @estado = Estado.friendly.find(params[:id])
    @eventosimg = Evento.find_by principal: 1
  end

  # GET /estados/new
  def new
    @estado = Estado.friendly.find(params[:id])
  end

  # GET /estados/1/edit
  def edit
    @estado = Estado.friendly.find(params[:id])
  end

  # POST /estados
  # POST /estados.json
  def create
    @estado = Estado.new(estado_params)
    respond_to do |format|
      if @estado.save
        format.html { redirect_to @estado, notice: 'Estado was successfully created.' }
        format.json { render action: 'show', status: :created, location: @estado }
      else
        format.html { render action: 'new' }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estados/1
  # PATCH/PUT /estados/1.json
  def update
    @estado = Estado.friendly.find(params[:id])
    respond_to do |format|
      if   @estado.update_attributes!(estado_params)
        format.html { redirect_to @estado, notice: 'Estado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estados/1
  # DELETE /estados/1.json
  def destroy
    @estado.destroy
    respond_to do |format|
      format.html { redirect_to estados_url }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado
      @estado = Estado.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_params
      params[:estado].permit(:estado, :photo, :evento, :descripcion)
    end


end
