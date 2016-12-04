Rails.application.routes.draw do
  devise_for :users, controllers:  {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles, only: [:show, :new, :edit, :create, :update]

  resources :profile_photos, only: [:destroy]
  resources :product_photos, only: [:destroy]

  resources :products

  root to: 'products#index'
end
