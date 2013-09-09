class HomeController < ApplicationController
	

  def index
  	@articulos = Articulo.search_for(params[:buscar]).paginate(:page => params[:page], :per_page => 5)

  end


  

 



end
