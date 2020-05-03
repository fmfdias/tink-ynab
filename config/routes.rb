# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  passwordless_for :users

  root 'home#index'
  resources :accounts, only: [:index]
  resources :synchronizations, only: [:create]
  resources :ynab_budgets
end
