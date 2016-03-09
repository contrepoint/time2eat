Rails.application.routes.draw do

  resources :groups, only: [:create, :new, :show, :index] do
  	resources :questions, only: [:create, :new]
  end
  devise_for :users
  root 'home#index'

  #### for layout test

  get 'layouttest' => 'layouttest#home'
  get 'layouttest/signup' => 'layouttest#signup'
  get 'layouttest/signin' => 'layouttest#login'
  get 'layouttest/newgroup' => 'layouttest#group'
  get 'layouttest/addquestion' => 'layouttest#add_question'
  get 'layouttest/voting' => 'layouttest#voting'

  #### for layout test

end
