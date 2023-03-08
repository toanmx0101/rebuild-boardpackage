Sidekiq.configure_server do |config|
  config.redis = {
    url: "redis://localhost:6379/0", pool_timeout: 2, size: (ENV["RAILS_MAX_THREADS"] || 5).to_i * 5
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: "redis://localhost:6379/0", pool_timeout: 2, size: (ENV["RAILS_MAX_THREADS"] || 5).to_i
  }
end