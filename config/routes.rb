Rails.application.routes.draw do
  get 'statistics/index'
  resources :child_details
  resources :patient_details
  resources :event_details

  root 'application#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/screening' => 'child_details#screening'
  get '/preventive_services' => 'child_details#preventative'
  get '/followup' => 'child_details#followup'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
