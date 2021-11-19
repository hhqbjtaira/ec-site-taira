Rails.application.routes.draw do
  resources :users
  resources :products
  resources :user_classifications
end
