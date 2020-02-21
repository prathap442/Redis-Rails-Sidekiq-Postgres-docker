the goal is to build an architecture as shown in the 

```
  redis_sidekiq_docker_postgresql.png
```

So the rails app basically has got the following models

> User
  this basically has got the
  - username
  - email
  relationships
  - has_many :tickets
> Event
  this basically has got the 
  - name
  relationships
  - has_many :tickets
> Ticket
  this basically has got the 
  - user_id
  - event_id
  relationships
  * belongs_to :user
  * belongs_to :event

----------------------------------------------------------------------------------------


Here some configurations are being done like building first the rails app with the docker 

- Once the app tended to go fine
- I have created the rake task for running the tasks and then creating the records in the tables of users,tickets,events
- I have later created the configuration for the cache
- Backside the redis is kept on running
- Now the Redis configured with the sidekiq too
- the Sidekiq is made to run the background that sleeps fo the sake of the 10sec
- For this we basically change the 

```
# config/development.rb with adding the following lines
  # for the cache sake
  config.cache_store = :redis_store, {
    expires_in: 1.hour,
    namespace: 'cache',
    redis: { 
      host: '172.23.0.3"',
      port: 6379,
      db: 0
    }
  }

  # for jobs sake
  config.active_job.queue_adapter = :sidekiq
```

Late the Worker class is basically created and then this worker class is being called ny the background job named by 

GuestsCleanupJob
  This basically has been using the dteh default queue and then this acaalls the worker class and then process the requests in the background.





```
              Name                            Command               State                Ports              
------------------------------------------------------------------------------------------------------------
playgroundredissidekiq_db_1        docker-entrypoint.sh postgres    Up      5432/tcp                        
playgroundredissidekiq_redis_1     docker-entrypoint.sh redis ...   Up      6379/tcp                        
playgroundredissidekiq_sidekiq_1   entrypoint.sh sidekiq            Up      3010/tcp, 9292/tcp              
playgroundredissidekiq_web_1       entrypoint.sh bash -c rm - ...   Up      0.0.0.0:3010->3010/tcp, 9292/tcp

```