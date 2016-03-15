Rails.application.routes.draw do

get 'votes/test' => 'votes#test'
get 'votes/test2' => 'votes#test2'

	resources :searches, only: [:index, :create]

  resources :groups do
  	get :autocomplete_user_email	, :on => :collection
  	resources :questions, only: [:create, :new]
  	resources :votes, only: [:create, :new, :index]
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
  get 'layouttest/voting/result' => 'layouttest#voting_result'
  get 'layouttest/search/result' => 'layouttest#search_result'
  get 'layouttest/search/details' => 'layouttest#search_details'

  #### for layout test

  delete 'group/:group_id/user/:user_id' => 'groups#deleteuser_from_group' , :as => :delete_user_group

end
