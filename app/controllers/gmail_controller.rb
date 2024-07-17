class GmailController < ApplicationController
  require 'gmail'

  def verify_email
    email_to_verify = params[:email]

    # Conectar a Gmail usando tus credenciales desde variables de entorno
    gmail = Gmail.connect!(ENV['GMAIL_USERNAME'], ENV['GMAIL_PASSWORD'])

    # Buscar mensajes del correo electrónico a verificar
    messages = gmail.inbox.emails(from: email_to_verify)

    if messages.any?
      render json: { exists: true, message_count: messages.size }
    else
      render json: { exists: false }
    end

    gmail.logout
  end
end
