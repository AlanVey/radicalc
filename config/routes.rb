Rails.application.routes.draw do
  resources :subjects, only: [:create, :edit, :update, :destroy]

  devise_for :users
  
  root 'home#index'
  get 'dashboard', to: 'subjects#index', as: 'dashboard'

  get '/subjects/new', to: 'subjects#new', as: :new_root_subject
  get '/subjects/(:id)', to: 'subjects#show', as: :show_subject
  get '/subjects/new/(:parent_id)', to: 'subjects#new', as: :new_subject

end
