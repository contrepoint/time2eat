Rails.application.routes.draw do
  resources :groups, only: [:create, :new, :show]
  devise_for :users
  root 'home#index'


end
