Rails.application.routes.draw do
  resources :items, only: [:index, :show]

  resources :carts, only: [:create]

  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  post '/cart', to: "carts#update"
  delete '/cart', to: "carts#destroy"

  get '/cart', to: 'carts#index'

  get '/dashboard', to: 'users#show'

  get '/about', to: 'categories#about'
  get '/:category_title', to: 'categories#show'
  root to: 'welcome#index'
end
