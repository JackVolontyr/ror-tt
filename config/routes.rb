Rails.application.routes.draw do
  resources :trains do
    resources :carriages
  end

  resources :stations do
    patch :update_position, on: :member
    patch :update_arrival, on: :member
    patch :update_departure, on: :member
  end

  resources :routes, :services, :seats, :tickets

  resource :search, only: %i[new show edit]

  get 'welcome/index'

  root 'welcome#index'
end
