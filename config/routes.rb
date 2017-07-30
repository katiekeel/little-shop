Rails.application.routes.draw do
  resources :items, only: [:index, :show]

  resources :carts, only: [:create]

  resources :users, only: [:new, :create]

  resources :orders, only: [:index, :show, :create]

  get '/edit_account', to: 'users#edit'
  patch 'update_account', to: 'users#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  post '/cart', to: "carts#update"
  delete '/cart', to: "carts#destroy"

  get '/cart', to: 'carts#index'

  get '/dashboard', to: 'users#show'

  get '/admin', to: 'sessions#new'

  get '/about', to: 'categories#about'

  get '/:category_title', to: 'categories#show'

  root to: 'welcome#index'
end
