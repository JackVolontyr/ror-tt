Rails.application.routes.draw do
  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :users do
    resources :tickets
  end

  resources :questions do
    resources :answers
  end

  resources :welcomes

  resource :search, only: %i[new show edit]

  namespace :admin do
    resources :trains do
      resources :carriages
    end

    resources :stations do
      patch :update_position, on: :member
      patch :update_arrival, on: :member
      patch :update_departure, on: :member
    end

    resources :routes, :seats
  end

  get 'searches/show'
  root 'searches#show'
end
