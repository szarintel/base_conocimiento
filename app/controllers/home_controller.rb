class HomeController < ApplicationController
	before_action :validacion
  def index
  	@articulos = Articulo.all
  end


  private

  def validacion
  	if !user_signed_in?
  		redirect_to entrar_path
  	 end
  end
end
