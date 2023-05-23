# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
require 'sidekiq-scheduler'

# Initialize the Rails application.
Rails.application.initialize!

Sidekiq::Scheduler.enabled = true
Sidekiq.schedule = {
  stat_email: {
    every: '1m',
    # cron: '0 0 * * 0',
    class: 'StatSenderWorker'
    }
}