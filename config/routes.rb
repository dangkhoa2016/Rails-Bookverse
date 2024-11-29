Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :book_categories
  resources :reviews
  resources :authors
  resources :categories
  resources :publishers
  resources :books
  resources :author_profiles
  resources :book_loans
  resources :members
  resources :libraries

  resources :settings, only: %i[index] do
    collection do
      post :update
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
