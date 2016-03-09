Rails.application.routes.draw do
  resources :groups, only: [:create, :new, :show]
  devise_for :users
  root 'home#index'

  get 'layouttest' => 'layouttest#home'
  get 'layouttest/signup' => 'layouttest#signup'
  get 'layouttest/signin' => 'layouttest#login'
  get 'layouttest/newgroup' => 'layouttest#group'

end
