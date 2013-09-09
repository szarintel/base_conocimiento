class AddAutorToArticulos < ActiveRecord::Migration
  def change
    add_column :articulos, :autor, :string
  end
end
