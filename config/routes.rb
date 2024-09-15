Rails.application.routes.draw do
  resources :line_stops
  resources :resin_programs
  resources :production_days
  resources :mf_tanks
  resources :uf_tanks
  resources :stop_reasons, only: [:new, :create, :index, :edit, :update, :destroy]
  devise_for :users

  get 'schedules', to: 'schedules#index'

  devise_scope :user do
    root to: "devise/sessions#new"
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
