Rails.application.routes.draw do
  resources :items,
            only: [:new]
  root 'home#index'
end
