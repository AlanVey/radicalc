Rails.application.routes.draw do

  root 'home#index'

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  # Subjects routes ===========================================================
  resources :subjects, only: [:create, :edit, :update, :destroy]

  get 'subjects/new', to: 'subjects#new', as: 'new_root_subject'
  get 'subjects/:parent_id/new', to: 'subjects#new', as: 'new_subject'
  get 'subjects/:id', to: 'subjects#show', as: 'show_subject'
    
  # Question routes =========================================================
  get 'subjects/:id/question/:kind', to: 'question#index', as: 'questions'
  get 'subjects/:id/question/:kind/new', to: 'question#new', as: 'new_question'
  get 'subjects/:id/question/:kind/show/:question_id', to: 'question#show', as: 'show_question'
  post 'subjects/:id/question/create/:kind', to: 'question#create', as: 'create_question'

  # Tests routes ==============================================================
  get 'subjects/:id/tests', to:'test#index', as: 'tests'
  get 'subjects/:id/tests/new', to:'test#new', as: 'new_test'
  get 'subjects/:id/tests/show/:test_id', to:'test#show', as: 'show_test'
  post 'subjects/:id/tests/create', to:'test#create', as: 'create_test'

  # Tests questions routes ====================================================
  get 'subjects/:id/tests/show/:test_id/question/show/:question_id', to: 'test_questions#show', as: 'show_test_question'
  get 'subjects/:id/tests/show/:test_id/question/new', to: 'test_questions#new', as: 'new_test_question'
  post 'subjects/:id/tests/show/:test_id/question/create', to: 'test_questions#create', as: 'create_test_question'
  delete 'subjects/:id/tests/show/:test_id/question/delete/:question_id', to: 'test_questions#destroy', as: 'delete_test_question'

  # User routes ===============================================================
  devise_for :users, controllers: { registrations: 'registrations', 
                                    passwords: 'passwords', 
                                    sessions: 'sessions' }

  # User Profile routes ======================================================= 
  get '/profile/edit', to: 'profiles#edit', as: 'edit_profile'
  get '/profile', to:'profiles#show', as: 'profile'
  patch '/profile', to: 'profiles#update', as: 'update_profile'

end
