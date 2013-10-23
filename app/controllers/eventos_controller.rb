class EventosController < ApplicationController
  before_action :signed_in_user,
                only: [:create, :index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    @eventos = Evento.all
    @micrositioevento= Micrositio.all
    @user = Evento.friendly.find(params[:id])
    @evento = Evento.friendly.find(params[:id])
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
    @estados = Estado.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = current_user.eventos.build(evento_params)
    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @evento }
      else
        format.html { render action: 'new' }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url }
      format.json { head :no_content }
    end
  end


  def has_attached_file
  end

  def photo
  end

  def search
    @eventos = Evento.search params[:search]
  end


  def following
    @title = "Following"
    @user = User.friendly.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def follower
    @title = "Followers"
    @user = User.friendly.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_evento
    @evento = Evento.friendly.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params[:evento].permit(:nombre, :descripcion, :photo, :precio, :fecha, :artista, :urloficial, :estado)
    end

  def correct_user
    @user = current_user.eventos.find_by(id: params[:id])
    redirect_to root_url if @user.nil?
  end


end
