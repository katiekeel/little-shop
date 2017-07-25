Rails.application.routes.draw do
  resources :items, only: [:index]

  get '/:category_title', to: 'categories#show'
end
