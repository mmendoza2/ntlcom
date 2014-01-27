class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :check_domain

  def check_domain
    if Rails.env.production? and request.host.downcase != 'www.notelimites.com'
      redirect_to request.protocol + 'www.notelimites.com' + request.fullpath, :status => 301
    end
  end



  def after_sign_in_path_for(resource)
    @user ||= current_user
    if @user.followed_actividades.count >= 3
    root_path
    else
    instrucciones_path
    end

  end





  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :avatar
  end
end
