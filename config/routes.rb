Rails.application.routes.draw do
  
  devise_for :users, :controllers => {registrations: 'registrations', passwords: 'passwords', sessions: 'sessions'}
  
  root 'home#index'

  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'

end
