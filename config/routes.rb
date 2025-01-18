Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :author_profiles do
    collection do
      get :by_author
    end
  end

  resources :authors do
    collection do
      get :by_book
      get :options_for_select
    end
  end

  resources :book_loans do
    collection do
      get :by_book
      get :by_member
    end
  end

  resources :books do
    collection do
      get :by_author
      get :by_category
      get :by_genre
      get :by_tag
      get :options_for_select
    end
  end

  resources :categories do
    collection do
      get :options_for_select
    end
  end

  resources :genres do
    collection do
      get :options_for_select
    end
  end

  resources :libraries do
    collection do
      get :options_for_select
    end
  end

  resources :members do
    collection do
      get :by_library
      get :options_for_select
    end
  end

  resources :published_dates do
    collection do
      get :by_book
      get :by_publisher
    end
  end

  resources :publishers do
    collection do
      get :options_for_select
    end
  end

  resources :reviews do
    collection do
      get :by_book
    end
  end

  resources :tags do
    collection do
      get :options_for_select
    end
  end

  resources :settings, only: %i[index] do
    collection do
      post :update
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'home#index'
end
