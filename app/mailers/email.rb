class Email < ActionMailer::Base
  default from: "sponce@zarintel.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.index.subject
  #
  def index(usuario,titulo)
   @usuario = usuario
   @titulo = titulo

    mail to: "sponce@zarintel.com", :subject=>"Artículo Nuevo - Base Conocimiento"
  end
end
