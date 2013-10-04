#encoding : utf-8
class Email < ActionMailer::Base
  default from: "informacia.zarintel@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.index.subject
  #
  def index(usuario,titulo)
   @usuario = usuario
   @titulo = titulo

    mail to: "sponce@zarintel.com,javila@zarintel.com,slazaro@zarintel.com,acameo@zarintel.com", :subject=>"Artículo Nuevo - Base Conocimiento"
  end
end
