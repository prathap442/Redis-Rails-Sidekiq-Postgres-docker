namespace :event_collector do
  desc "Users to get created"
  task users_generator: :environment do
    100.times do
      username = Faker::Name.first_name
      User.create(username: username, email: "#{username}@gmail.com")
    end
  end

  desc "Events to get created"
  task events_generator: :environment do
    ["pes-alma","hrf-alma",'ces-alma'].each do |alumni_connect_event|
      Event.create(event_name: alumni_connect_event)
    end
  end
  

  desc "For tickets to get generated"
  task tickets_generator: :environment do
    User.all.each do |user|
      Ticket.create(event_id: Random.rand(1..3), user_id: user.id, price: Random.rand(23..6789))
    end
  end
end
