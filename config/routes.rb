Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :profiles, only: [:new, :create, :show, :edit, :update]

  resources :orders, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :payments, only: [:new, :create]
  end

  namespace :artists do
    resources :profiles, only: :show
  end

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root to: 'pages#index'

  get '/deliver/:id', to: 'orders#update_deliver', as: 'deliver'

end
