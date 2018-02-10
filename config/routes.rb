Rails.application.routes.draw do
  resources :tickets, param: :token
  devise_for :users
  root to: 'visitors#index'

end
