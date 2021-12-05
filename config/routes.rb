Rails.application.routes.draw do
  root "static_pages#home"
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get 'login', to:'sessions#new', as: 'login'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy', as: 'logout'
  resources :orders
  resources :users
  resources :products
end
