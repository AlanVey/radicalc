Rails.application.routes.draw do
  
  root 'home#index'

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  # Subjects routes ===========================================================
  resources :subjects, only: [:create, :edit, :update, :destroy]

  get 'subjects/new', to: 'subjects#new', as: :new_root_subject
  get 'subjects/:id', to: 'subjects#show', as: :show_subject
  get 'subjects/:parent_id/new', to: 'subjects#new', as: :new_subject

  # Users routes ==============================================================
  devise_for :users, controllers: { registrations: 'registrations', 
                                    passwords: 'passwords', 
                                    sessions: 'sessions' }

end
