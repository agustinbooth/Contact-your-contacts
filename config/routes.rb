Rails.application.routes.draw do
  resources :memberships
  root "groups#index"
  devise_for :users
  resources :groups
  resources :contacts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
