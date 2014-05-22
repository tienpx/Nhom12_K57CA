OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '298190147023486','1f9fccabd4c42ee35ea7fab248221b82'
end
