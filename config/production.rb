
config.action_mailer.delivery_method = :smtp
host = 'localhost:3000'
config.action_mailer.default_url_options = { :host => 'localhost:3000', protocol: 'http' }
# SMTP settings for gmail
config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => '',
  :password             => '',
  :authentication       => "plain",
  :enable_starttls_auto => true
}