Rails.application.routes.draw do
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get 'login', to:'sessions#new', as: 'login'
  post    'login',   to: 'users#show', as: 'login'
  delete  'logout',  to: 'sessions#new', as: 'logout'
  resources :orders
  resources :users
  resources :products
end
