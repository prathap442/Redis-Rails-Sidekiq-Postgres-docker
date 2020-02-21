require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  post 'tickets/user_tickets', to: 'tickets#user_tickets'
  get 'tickets/user_tickets', to: 'tickets#user_tickets'
  get 'tickets/event_tickets_count', to:'tickets#event_tickets_count'
  resources :tickets
  resources :events
  resources :users
  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
