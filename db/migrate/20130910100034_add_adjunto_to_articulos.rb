class AddAdjuntoToArticulos < ActiveRecord::Migration
  def change
    add_column :articulos, :adjunto, :binary
  end
end
