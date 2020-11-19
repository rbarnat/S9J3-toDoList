Rails.application.routes.draw do
  devise_for :users
  # root to: "home#index"
  resources :tasks, except: [:show]
  root to: "emails#index"
  resources :emails, only: [:index, :show, :create, :destroy]
end
