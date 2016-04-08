Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :user
  resources :items, only: [:index, :new, :create]
  root 'home#index'
end
