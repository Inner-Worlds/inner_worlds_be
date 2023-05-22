# require "sidekiq-scheduler"

# Sidekiq::Scheduler.enabled = true
# Sidekiq::Scheduler.every "1w", at: 'start of the week', class: 'StatSenderJob'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end