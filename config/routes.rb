Rails.application.routes.draw do
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  resources :users
  resources :products
end
