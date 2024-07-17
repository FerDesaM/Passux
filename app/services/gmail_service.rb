# app/services/gmail_service.rb
class GmailService
  def initialize(username, password)
    @username = username
    @password = password
  end

  def verify_email(email_to_verify)
    gmail = Gmail.connect!(@username, @password)
    messages = gmail.inbox.emails(from: email_to_verify)
    gmail.logout
    messages.any?
  end
end
