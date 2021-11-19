Rails.application.routes.draw do
  get 'login', to:'sessions#new', as: 'login'
  resources :users
  resources :products
end
