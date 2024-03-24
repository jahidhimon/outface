# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :posts, only: %i[index new create show] do
    resources :loves, only: %i[index create]
    resources :comments, only: %i[index create]
  end

  get 'profile/:id', to: 'account#profile', as: 'profile'
  get 'users', to: 'account#index', as: 'users'
  get 'settings', to: 'account#settings', as: 'edit_account'
  patch 'settings', to: 'account#update', as: 'update_account'

  post 'profile/:id/follow', to: 'follow#create', as: 'follow'
  delete 'profile/:id/unfollow', to: 'follow#destroy', as: 'unfollow'

  get  'profile/:id/followers', to: 'follow#index', as: 'followers'

  root 'account#dashboard'
end
