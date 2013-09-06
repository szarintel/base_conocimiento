class Articulo < ActiveRecord::Base
# encoding: utf-8


scoped_search :on => [:palabras_claves, :descripcion, :titulo]

validates :titulo,:descripcion,:palabras_claves, :presence =>true 
=begin


def self.search(palabras_recibidas)
	
		#recojo las palabras claves del usuario que ha introducido junto a cuantas a puesto
		indices = Array.new
		palabras_claves_recibidas = palabras_recibidas.split(" ")

	
		#Recorrido de la tabla
			Articulo.all.each do |fila|
				#Recojo campo de palabras claves de la base de datos
				palabras_tabla = fila.palabras_claves.split(',')
				puts "palabras recogidas de la bd #{palabras_tabla.inspect}"
				palabras_claves_recibidas.each do |p|
					puts "palabra #{p}"
					if palabras_tabla.include?(p)
						indices << fila.id

					end
					
				end

			end

			
		
		
		
end

=end


	
end
