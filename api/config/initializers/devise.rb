Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = '052f4cdbd4add5d453911d491ea1c36467778c2742bdc26a039b48bc4b9ad815097e38b08240b80bcf603daffa65544d5e247f3287a6f540598b4e2e8355e6cd'

  config.mailer_sender = 'mauriliohrc@gmail.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.remember_for = 1.minutes
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.navigational_formats = []
  config.sign_out_via = :delete
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  config.jwt do |jwt|
    jwt.secret = Rails.application.credentials.devise_jwt_secret_key!
    jwt.dispatch_requests = [ ['POST', %r{^/login$}] ]
    jwt.revocation_requests = [ ['DELETE', %r{^logout$}] ]
    jwt.expiration_time = 1.minutes.to_i
  end
end
