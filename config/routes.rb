Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles

  root to: 'pages#index'


end
