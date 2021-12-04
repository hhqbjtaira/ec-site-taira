Rails.application.routes.draw do
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get 'login', to:'sessions#new', as: 'login'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy', as: 'logout'
  resources :orders
  resources :users, :only => [:show, :edit, :update, :destroy]
  resources :products
end
