Rails.application.routes.draw do
  resources :tickets, param: :token
  devise_for :users, :controllers => { registrations: 'registrations' }
  as :user do
    get "/login" => "devise/sessions#new" # custom path to login/sign_in
  #  get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  #  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  #  put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  root to: 'visitors#index'
  get   'ticket_search' => 'tickets#search'
  post  'comments'      => 'comments#create'
  get   'tickets/:token/destroy' => 'tickets#destroy', as: :destroy
  post  'tickets/:token/destroy' => 'tickets#destroy'
  get   'tickets/:token/mark_as_read' => 'tickets#mark_as_read', as: :mark_as_read
  

end
