Rails.application.routes.draw do

  root 'home#index'
  get 'post' => 'posts#new'
 

end
