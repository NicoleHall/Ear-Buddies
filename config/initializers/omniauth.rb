Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['consumer_api_key'], ENV['consumer_api_secret']
end
