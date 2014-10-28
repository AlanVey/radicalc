Rails.application.routes.draw do
  resources :subjects

  devise_for :users
  
  root 'home#index'
  get 'dashboard', to: 'subjects#index', as: 'dashboard'

end
