Rails.application.routes.draw do
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get 'login', to:'sessions#new', as: 'login'
  patch 'user', to: 'users#update'
  put 'user', to: 'users#update'
  resources :orders
  resources :users
  resources :products
end
