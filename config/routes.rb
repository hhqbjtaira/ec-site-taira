Rails.application.routes.draw do
  get 'products/show_not_found'
  resources :products
end
