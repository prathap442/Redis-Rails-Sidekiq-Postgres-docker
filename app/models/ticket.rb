class Ticket < ApplicationRecord
  belongs_to :event,touch: true
  belongs_to :user, touch: true
  scope :event_total_amount, ->(event_id){ Ticket.where(event_id: event_id).each(&:price)}
  scope :user_tickets, ->(user_id){ Rails.cache.fetch("user_tickets/#{user_id}") { Ticket.where(user_id: user_id)} }
  scope :event_tickets_count, ->(event_id){ Rails.cache.fetch("event_tickets/#{event_id}"){ Ticket.where(event_id: event_id).count }}
end
