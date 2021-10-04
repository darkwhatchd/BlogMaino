ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.dig(:sendgrid, :user_name), # This is the string literal 'apikey', NOT the ID of your API key
  password: Rails.application.credentials.dig(:sendgrid, :password), # This is the secret sendgrid API key which was issued during API key creation
  domain: 'damp-basin-30375.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :login,
  enable_starttls_auto: true
}