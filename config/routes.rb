Rails.application.routes.draw do

  root to: 'supplies#index'
  
  resources :shops
  resources :categories
  resources :groups

  resources :supplies
  resources :products do
    member do
      put :start
      put :finish
      put :less
    end
  end

end
