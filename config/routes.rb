Rails.application.routes.draw do
  resources :production_days
  resources :mf_tanks
  resources :uf_tanks

  # Devise routes for users
  devise_for :users

  # Ensure correct mapping for root route
  devise_scope :user do
    root to: "devise/sessions#new"  # Redirect to login page when not authenticated
  end

  resources :pallets do
    collection do
      get 'search'
    end

    member do
      get :print
    end
  end
end
