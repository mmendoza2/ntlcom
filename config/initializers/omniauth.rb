OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '182819485154177', 'd0a0ccde76db8a64187351ffa7f8d465',
           scope: "email, publish_stream",
           :secure_image_url => 'true'
end
