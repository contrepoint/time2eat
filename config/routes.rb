Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'layouttest' => 'layouttest#home'
  get 'layouttest/signup' => 'layouttest#signup'
  get 'layouttest/signin' => 'layouttest#login'
  get 'layouttest/newgroup' => 'layouttest#group'
  get 'layouttest/addquestion' => 'layouttest#add_question'

end
