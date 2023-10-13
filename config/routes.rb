Rails.application.routes.draw do
  resources :child_details
  resources :patient_details
  resources :event_details

  root 'application#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

end
