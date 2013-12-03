class NotelimitesController < ApplicationController


  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @micrositios = Micrositio.all
    end
  end

  def ayuda
  end


  def nosotros
  end

  def contacto
  end

  def terminos
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end