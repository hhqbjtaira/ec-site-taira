Rails.application.routes.draw do
  get 'login', to:'sessions#new', as: 'login'
  resources :orders
  resources :users
  resources :products
end
