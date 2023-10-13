Rails.application.routes.draw do
  resources :child_details
  resources :patient_details
  resources :event_details
  get "up" => "rails/health#show", as: :rails_health_check
end
