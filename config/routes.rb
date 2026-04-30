Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "dashboard", to: "dashboard#index"
end
