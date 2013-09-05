json.array!(@articulos) do |articulo|
  json.extract! articulo, :titulo, :descripcion, :palabras_claves
  json.url articulo_url(articulo, format: :json)
end
