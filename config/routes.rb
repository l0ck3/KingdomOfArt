Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
  resources :profiles, only: [:show, :edit, :update]
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]
=======
  resources :profiles, only: [:show, :edit, :update] do
    resources :orders, only: [:index, :new, :create, :edit, :update, :destroy]
  end
>>>>>>> 57e1d223fb80a18c0d853b9ba05ca71a633cf5e2

  root to: 'pages#index'
end
