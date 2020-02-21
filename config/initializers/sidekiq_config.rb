require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { 
    db: 1,
    host: '172.23.0.3'
  }
end

Sidekiq.configure_server do |config|
  config.redis = {
      db: 1,
      host: '172.23.0.3'
  }
end 