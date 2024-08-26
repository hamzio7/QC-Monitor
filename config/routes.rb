Rails.application.routes.draw do
  resources :production_days
  resources :mf_tanks
  resources :uf_tanks

  resources :pallets
  root "pallets#index"

  resources :pallets do
    collection do
      get 'search'
    end
  end
end



