Rails.application.routes.draw do
  resources :items, only: [:new, :create]
  root 'home#index'
end
