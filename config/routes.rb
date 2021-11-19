Rails.application.routes.draw do
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get 'login', to:'sessions#new', as: 'login'
  resources :users
  resources :products
end
