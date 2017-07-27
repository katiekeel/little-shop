Rails.application.routes.draw do
  resources :items, only: [:index, :show]

  resources :carts, only: [:create]

  post '/cart', to: "carts#update"
  delete '/cart', to: "carts#destroy"

  get '/cart', to: 'carts#index'

  get '/about', to: 'categories#about'
  get '/:category_title', to: 'categories#show'
  root to: 'welcome#index'
end
