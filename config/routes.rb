Rails.application.routes.draw do
  root "groups#index"
  resources :memberships, only: [:new, :create, :destroy]
  devise_for :users
  resources :groups
  resources :contacts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
