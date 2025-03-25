Rails.application.routes.draw do
  # Define resourceful routes for pages, but skip the default :show action.
  resources :pages

  # Create a custom route that maps URLs like /pages/contact
  # to the pages#permalink action. This creates the helper
  # pages_permalink_path.
  get "/pages/:permalink", to: "pages#permalink", as: "pages_permalink"

  # Other routes
  root to: "home#index"
  resources :publishers, only: [ :index, :show ]
  resources :books, only: [ :index, :show ]

  get "up" => "rails/health#show", as: :rails_health_check
end
