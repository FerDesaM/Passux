# app/controllers/gmail_controller.rb
class GmailController < ApplicationController
  def initialize(service = GmailService.new(ENV['GMAIL_USERNAME'], ENV['GMAIL_PASSWORD']))
    @gmail_service = service
  end

  def verify_email
    email_to_verify = params[:email]
    if @gmail_service.verify_email(email_to_verify)
      render json: { exists: true }
    else
      render json: { exists: false }
    end
  end
end
