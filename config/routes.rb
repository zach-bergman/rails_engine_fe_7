Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :merchants, only: [:index, :show]
  resources :items, only: [:index, :show]

  get "/search", to: "search#index"
end
