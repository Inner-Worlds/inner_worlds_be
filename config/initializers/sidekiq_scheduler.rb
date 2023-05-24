require 'sidekiq-scheduler'

Sidekiq::Scheduler.enabled = true
Sidekiq.schedule = {
  stat_email: {
    every: '1m',
    # cron: '0 0 * * 0',
    class: 'StatSenderWorker'
  }
}