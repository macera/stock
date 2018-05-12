Rails.application.routes.draw do

  root to: 'stockouts#index'
  
  resources :shops
  resources :categories
  resources :groups

  resources :supplies, shallow: true do
    resources :products do
      member do
        put :start
        put :finish
        put :less
      end
    end
  end

  resources :analysises, only: [:index]
  resources :stockouts, only: [:index]

end
