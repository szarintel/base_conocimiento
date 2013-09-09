class HomeController < ApplicationController
	before_action :validacion 

  def index
  	@articulos = Articulo.search_for(params[:buscar]).paginate(:page => params[:page], :per_page => 5)

  end


  
private
  def validacion
    if !user_signed_in? 
      redirect_to entrar_path
     end
  end
 



end
