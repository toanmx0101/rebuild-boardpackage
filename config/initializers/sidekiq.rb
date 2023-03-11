Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV["REDIS_URL"] || "redis://localhost:6379/1", pool_timeout: 2, size: (ENV["RAILS_MAX_THREADS"] || 5).to_i
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV["REDIS_URL"] || "redis://localhost:6379/1", pool_timeout: 2, size: (ENV["RAILS_MAX_THREADS"] || 5).to_i
  }
end