class NotelimitesController < ApplicationController


  def home
      @micrositios = Micrositio.all
      @user = User.all

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