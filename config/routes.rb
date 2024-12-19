Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :author_profiles
  resources :authors
  resources :book_loans
  resources :books
  resources :categories
  resources :genres
  resources :libraries
  resources :members
  resources :published_dates
  resources :publishers
  resources :reviews
  resources :tags

  resources :settings, only: %i[index] do
    collection do
      post :update
    end
  end

  resources :locales, only: %i[] do
    collection do
      get :switch
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
