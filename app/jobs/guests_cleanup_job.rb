require 'sidekiq'
require 'sidekiq/worker'
include Sidekiq::Worker
class GuestsCleanupJob < ApplicationJob
  queue_as :default
  def perform(complexity)
    SidekiqWorker.perform_async(complexity)
  end
end
