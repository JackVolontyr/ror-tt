Rails.application.routes.draw do
  resources :trains do
    resources :carriages
  end

  resources :stations do
    patch :update_position, on: :member
  end

  resources :routes, :services, :seats, :tickets

  get 'welcome/index'

  root 'welcome#index'
end
