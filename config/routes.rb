Rails.application.routes.draw do
  root 'events#index'
  get '/users/sign_in', to: 'users#sign_in' 
  post '/users/sign_in_action', to: 'users#sign_in_action' 
  resources :users
  resources :events 
end
