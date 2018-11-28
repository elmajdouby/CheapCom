Rails.application.routes.draw do
  resources :products

  get '/products/buy/:id', to: 'products#buy', as: 'buyproduct'
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :producttypes
  resources :productimages
end
