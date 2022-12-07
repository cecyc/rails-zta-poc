Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/profile'
  get 'dashboard/super_secret'

  resources :login, only: [:new, :create]

  root "login#new"
end
