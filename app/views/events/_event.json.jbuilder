json.extract! event, :id, :event_name, :created_at, :updated_at
json.url event_url(event, format: :json)
