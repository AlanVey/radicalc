Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations', passwords: 'passwords', sessions: 'sessions'}

  resources :subjects, only: [:create, :edit, :update, :destroy]
  
  root 'home#index'
  get 'dashboard', to: 'subjects#index', as: 'dashboard'

  get '/subjects/new', to: 'subjects#new', as: :new_root_subject
  get '/subjects/(:id)', to: 'subjects#show', as: :show_subject
  get '/subjects/new/(:parent_id)', to: 'subjects#new', as: :new_subject

end
