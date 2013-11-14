OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
  provider :facebook, '626384007393278', 'c8e03770698ac3fa74828538c16dceb9',
           scope: "email, publish_stream",
           :secure_image_url => 'true'

  else
 provider :facebook, '182819485154177', 'd0a0ccde76db8a64187351ffa7f8d465',
          scope: "email, publish_stream",
          :secure_image_url => 'true'
  end
end
