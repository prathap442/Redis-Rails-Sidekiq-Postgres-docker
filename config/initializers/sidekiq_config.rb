# in config/initializers/sidekiq.rb
schedule = [
  {
    'name' => MyName,
    'class' => MyJob,
    'cron'  => '1 * * * *',  
    'queue' => default,
    'active_job' => true
  }
]
Sidekiq.configure_server do |config|
 config.redis = { 
   host:'localhost',
   port: 6379,
   db: 1 
 }
 Sidekiq::Cron::Job.load_from_array! schedule
end
Sidekiq.configure_client do |config|
  config.redis = { 
    host:'localhost',
    port: 6379,
    db: 1 
  }
end