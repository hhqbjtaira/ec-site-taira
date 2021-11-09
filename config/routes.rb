Rails.application.routes.draw do
  get 'products/show_not_found'
  root "static_pages#home"
  resources :products
end
