Rails.application.routes.draw do
  root "products#index"

  get "signup", to: "registrations#new", as: :signup
  post "signup", to: "registrations#create"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"

  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
  end
  resource :unsubscribe, only: [ :show ]
  resources :registrations, only: [:new]
  resources :users, only: [:new, :create]
end
