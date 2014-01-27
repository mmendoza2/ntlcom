class CategoriasController < ApplicationController
  before_filter :authenticate_user!

  # GET /actividades
  # GET /actividades.json
  def index
    @categoria = Categoria.all
  end

  # GET /actividades/1
  # GET /actividades/1.json
  def show
  end

  # GET /actividades/new
  def new
    @categoria = Categoria.friendly.find(params[:id])
  end

  # GET /actividades/1/edit
  def edit
    @categoria = Categoria.friendly.find(params[:id])

  end

  # POST /actividades
  # POST /actividades.json
  def create
    @categoria = Categoria.new(categoria_params)

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to @categoria, notice: 'Actividad was successfully created.' }
        format.json { render action: 'show', status: :created, location: @categoria }
      else
        format.html { render action: 'new' }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividades/1
  # PATCH/PUT /actividades/1.json
  def update
    @categoria = Categoria.friendly.find(params[:id])

    respond_to do |format|
      if @categoria.update(categoria_params)
        format.html { redirect_to @categoria, notice: 'Actividad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividades/1
  # DELETE /actividades/1.json
  def destroy
    @categoria.destroy
    respond_to do |format|
      format.html { redirect_to actividadespadre_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @categoria = Categoria.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_params
      params[:categoria].permit(:name, :photo, :descripcion)
    end
end
