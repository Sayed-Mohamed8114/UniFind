Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root to: "home#index"

  get "dashboard", to: "dashboard#index"

  resources :items, except: [:index] do
    resources :comments, only: [:create, :destroy, :edit, :update]
    resources :claims, only: [:new, :create]
  end

  resources :notifications, only: [:index] do
    member do
      patch :mark_as_read
    end
  end

  resources :claims, only: [] do
    collection do
      get :my_items_claims
    end
  end
end