Rails.application.routes.draw do 
  authenticated :user, ->(user) { user.can_access_admin_dashboard? } do
    get 'admin', to: 'admin#index'
    get 'admin/events'
    get 'admin/show_event'
  end

  root 'pages#home'

  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :events

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks', 
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }

  resources :users

end
