Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  passwordless_for :users

  root 'home#index'
  resources :accounts, only: [:index]
end
