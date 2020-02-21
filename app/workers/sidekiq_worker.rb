require 'sidekiq'
require './app/jobs/guests_cleanup_job.rb'
require 'rails'
class SidekiqWorker
  include Sidekiq::Worker

  def perform(complexity)
    puts "Hey I'm in the sidekiq worker"
    User.all.each{|user| puts user.username}
    case complexity
    when 'hard'
      puts "it is hard to compute"
    when 'easy'
      puts "it is easy to compute"
    else
      puts "slepp 0 seconds"
    end  
  end
end