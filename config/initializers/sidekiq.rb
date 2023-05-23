require "sidekiq-scheduler"

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

# Sidekiq::Scheduler.enabled = true
# Sidekiq::Scheduler.cron '30 9 * * 1', class: 'StatSenderWorker', args: -> { User.pluck(:id) }