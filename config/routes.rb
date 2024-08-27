Rails.application.routes.draw do
  resources :production_days
  resources :mf_tanks
  resources :uf_tanks



  root "pallets#index"

  resources :pallets do
    collection do
      get 'search'
    end

    member do
      get :print
    end

  end
end



