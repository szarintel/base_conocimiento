class HomeController < ApplicationController
	before_action :validacion 

  def index
  	@articulos = Articulo.search_for(params[:buscar]).paginate(:page => params[:page], :per_page => 5)

  end

  def bajar

  		articulo = Articulo.find(params[:id])
  		send_file Rails.root.join('public','uploads',articulo.id.to_s,articulo.adjunto)
  
  end

 def eliminar

  	articulo = Articulo.find(params[:id])
  	
  	begin 
  		File.delete(Rails.root.join('public','uploads',articulo.id.to_s,articulo.adjunto))
  		articulo.adjunto = nil
		articulo.save
  	rescue Errno::ENOENT
	  	redirect_to edit_articulo_path(articulo.id)
	  	flash[:alert] = "Error al borrar el fichero, puede que el archivo no exista"
	else

		redirect_to edit_articulo_path(articulo.id), :notice => "Fichero eliminado correctamente"
  	end

 
  		
  	

  
  end

  
private
  def validacion
    if !user_signed_in? 
      redirect_to entrar_path
     end
  end
 



end
