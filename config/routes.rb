Rails.application.routes.draw do
  root 'events#index'
  get '/users/sign_in', to: 'users#sign_in' 
  post '/users/sign_in_action', to: 'users#sign_in_action' 
  delete '/users/sign_out', to: 'users#sign_out'
  delete '/invite/destroy', to: 'eventsusers#destroy', as: 'destroy_invite'
  get '/current_user_events', to: 'users#my_events', as: 'my_events'
  post 'events/:id/users/:id', to: 'eventsusers#create', as: 'events_users'
  resources :users
  resources :events 
end
