Rails.application.routes.draw do
  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'

  devise_for :users
  
  root 'home#index'

end
