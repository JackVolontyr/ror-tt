Rails.application.routes.draw do
  resources :trains

  resources :stations do
    patch :update_position, on: :member
  end

  resources :routes

  resources :services

  resources :carriages

  resources :seats

  resources :tickets
  get 'welcome/index'

  root 'welcome#index'
end
