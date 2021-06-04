Rails.application.routes.draw do
  root "groups#index"
  resources :memberships, only: [:new, :create, :destroy]
  devise_for :users
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :contacts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
