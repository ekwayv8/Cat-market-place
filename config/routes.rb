Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  root to: 'items#index'
  resources :carts
  resources :items
  post 'items/new', to: 'image_uploads#create'
  resources :orders


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
