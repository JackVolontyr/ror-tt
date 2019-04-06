Rails.application.routes.draw do
  resources :trains
  resources :stations
  resources :routes
  resources :services
  resources :carriages
  resources :seats
  get 'welcome/index'

  root 'welcome#index'
end
