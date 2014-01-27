class NotelimitesController < ApplicationController


  def home
      @micrositios = Micrositio.all
      @eventos = Evento.all
      @actividades = Actividad.all
      @users = User.all



  end

  def ayuda
  end


  def nosotros
  end

  def contacto
  end

  def terminos
  end

  def instrucciones
    @actividades = Actividad.all
  end


end