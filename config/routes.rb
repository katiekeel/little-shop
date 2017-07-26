Rails.application.routes.draw do
  resources :items, only: [:index]

  get '/about', to: 'categories#about'
  get '/:category_title', to: 'categories#show'

end
