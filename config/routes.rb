Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'
  get 'profiles/:id', to: 'profiles#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vehicles do
    resources :bookings, only: %i[new create edit update]
    resources :reviews, only: %i[new create edit update]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
end
