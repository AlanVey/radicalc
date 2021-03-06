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
  get 'subjects/:id/question/:kind/show/:question_id', to: 'question#show', as: 'show_question'
  post 'subjects/:id/question/create/:kind', to: 'question#create', as: 'create_question'

  # Tests routes ==============================================================
  get 'subjects/:id/tests', to:'test#index', as: 'tests'
  get 'subjects/:id/tests/show/:test_id', to:'test#show', as: 'show_test'
  post 'subjects/:id/tests/create', to:'test#create', as: 'create_test'

  # Tests questions routes ====================================================
  get 'subjects/:id/tests/show/:test_id/question/show/:question_id', to: 'test_questions#show', as: 'show_test_question'
  post 'subjects/:id/tests/show/:test_id/question/create', to: 'test_questions#create', as: 'create_test_question'
  delete 'subjects/:id/tests/show/:test_id/question/delete/:question_id', to: 'test_questions#destroy', as: 'delete_test_question'

  # Answers routes ============================================================
  get 'question/show/:test_id/answers', to:'answers#index', as:'answers'
  get 'question/show/:test_id/answer/show', to:'answers#show', as:'show_answer'
  post 'question/show/:test_id/answer/upload', to:'answers#upload', as:'upload_answer'
  patch 'question/show/:test_id/answer/upload', to:'answers#reupload'

  # Scores routes =============================================================
  get 'question/show/:test_id/answers/:answer_id/new_score', to:'scores#new', as:'new_score'
  get 'question/show/:test_id/score/:id/edit_score', to:'scores#edit', as:'edit_score'
  post 'question/show/:test_id/answers/:answer_id/create_score', to:'scores#create', as:'create_score'
  patch 'question/show/:test_id/score/:id/update_score', to:'scores#update', as:'update_score'

  # Solutions routes ============================================================
  get 'question/show/:test_id/solutions', to:'solutions#index', as:'solutions'
  get 'question/show/:test_id/solution', to:'solutions#show', as:'show_solution'
  post 'question/show/:test_id/solution/upload', to:'solutions#upload', as:'upload_solution'
  patch 'question/show/:test_id/solution/upload', to:'solutions#reupload'

  # Subscriptions routes ======================================================
  get 'subjects/:subject_id/subscription/new', to: 'subscriptions#new', as: 'new_subscription'
  post 'subjects/:subject_id/subscription/new/:user_id/:privilege', to: 'subscriptions#create', as: 'create_subscription'
  post 'subjects/:subject_id/subscribe/:id', to: 'subscriptions#subscribe', as: 'subscribe'
  delete 'subjects/:subject_id/unsubscribe/:id', to: 'subscriptions#unsubscribe', as: 'unsubscribe'

  # User routes ===============================================================
  devise_for :users, controllers: { registrations: 'registrations', 
                                    passwords: 'passwords', 
                                    sessions: 'sessions' }

  # User Profile routes ======================================================= 
  get '/profile/edit', to: 'profiles#edit', as: 'edit_profile'
  get '/profile', to:'profiles#show', as: 'profile'
  get '/profile/show/:id', to: 'profiles#show_user', as: 'show_profile'
  patch '/profile', to: 'profiles#update', as: 'update_profile'

  # Cloudship =================================================================

  get '/loaderio-1309bf729c6673e820ae839e4abbe0b1', to: 'home#index'

end
