Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show, :edit, :update]
  resources :products, only: [:index, :new, :create, :edit, :destroy]

  root to: 'pages#index'

end

