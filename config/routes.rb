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
  get 'subjects/:id/question/show/:question_id', to: 'question#show', as: 'show_question'
  get 'subjects/:id/question/new/general', to: 'question#new_general', as: 'new_general_question'
  get 'subjects/:id/question/new/technical', to: 'question#new_technical', as: 'new_technical_question'
  post 'subjects/:id/question/general', to: 'question#create_general', as: 'create_general_question'
  post 'subjects/:id/question/technical', to: 'question#create_technical', as: 'create_technical_question'

  # User routes ===============================================================
  devise_for :users, controllers: { registrations: 'registrations', 
                                    passwords: 'passwords', 
                                    sessions: 'sessions' }

  # User Profile routes ======================================================= 
  get '/profile/edit', to: 'profiles#edit', as: 'edit_profile'
  get '/profile', to:'profiles#show', as: 'profile'
  patch '/profile', to: 'profiles#update', as: 'update_profile'

end
