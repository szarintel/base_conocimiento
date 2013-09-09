class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :validacion


private
  def validacion
  	if !user_signed_in?
  		redirect_to entrar_path
  	 end
  end
end
