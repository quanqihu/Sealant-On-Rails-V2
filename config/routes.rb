# frozen_string_literal: true

Rails.application.routes.draw do
  resources :child_level_details
  get 'statistics/index'
  get 'statistics/school'
  resources :child_details
  resources :patient_details
  resources :event_details

  root 'application#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/child_data' => 'child_level_details#child_data'
  get '/screening' => 'child_details#screening'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
