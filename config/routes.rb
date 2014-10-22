Rails.application.routes.draw do
  resources :subjects

  devise_for :users
  
  root 'home#index'
  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'

end
