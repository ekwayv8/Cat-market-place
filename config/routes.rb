Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/show'
  get 'orders/create'
  get 'orders/update'
  get 'orders/destroy'
  get 'carts/new'
  get 'carts/show'
  get 'carts/create'
  get 'carts/update'
  get 'carts/destroy'
  
  root to: 'items#index'
  
  resources :items

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
