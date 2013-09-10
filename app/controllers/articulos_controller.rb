#encoding: utf-8
class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show, :edit, :update, :destroy]
   before_action :validacion 



  # GET /articulos
  # GET /articulos.json
  def index
    @articulos = Articulo.all

  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show

   
  end

  # GET /articulos/new
  def new
    @articulo = Articulo.new
  end

  # GET /articulos/1/edit
  def edit
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @articulo = Articulo.new(articulo_params)

    adjunto = params[:articulo][:adjunto]
    if adjunto
     @articulo.adjunto = adjunto.original_filename
    end


    respond_to do |format|
      if @articulo.save
           #Crear directorio
    if adjunto

      guardar_archivo(adjunto,@articulo)
   
    end
        format.html { redirect_to @articulo, notice: 'Articulo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @articulo }

 
      else
        format.html { render action: 'new' }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    adjunto = params[:articulo][:adjunto]
    if adjunto
     @articulo.adjunto = adjunto.original_filename
    end
    respond_to do |format|
     
      if @articulo.update(articulo_params)  
         if adjunto
        File.open(Rails.root.join('public','uploads',@articulo.id.to_s,adjunto.original_filename),'wb') do |file|
            file.write(adjunto.read)
          end
        end
     
        format.html { redirect_to root_path, notice: 'Articulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:articulo).permit(:titulo, :descripcion, :palabras_claves,:autor)
    end





  def validacion
    if !user_signed_in? 
      redirect_to entrar_path
     end
  end



  def guardar_archivo(fichero_adjunto,articulo_fila)

    if not Dir.exists?Rails.root.join('public','uploads',articulo_fila.id.to_s)
     Dir.mkdir(Rails.root.join('public','uploads',articulo_fila.id.to_s)) 
    

          File.open(Rails.root.join('public','uploads',articulo_fila.id.to_s,fichero_adjunto.original_filename),'wb') do |file|
            file.write(fichero_adjunto.read)
          end
    end
  end

end
