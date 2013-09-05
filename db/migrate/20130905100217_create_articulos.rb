class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.text :descripcion
      t.string :palabras_claves

      t.timestamps
    end
  end
end
