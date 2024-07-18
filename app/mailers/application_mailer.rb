#
# Clase base para el envio de correos
#
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end
