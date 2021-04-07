ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'honda0924@gmail.com',
  password: 'th271828',
  authentication: 'plain',
  enable_starttls_auto: true
}