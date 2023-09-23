Rails.application.routes.draw do 
  # Admin
  authenticated :user, ->(user) { user.can_access_admin_dashboard? } do
    namespace :admin do
      resources :events
      resources :users
      root to: 'admin#index'
    end
  end

  # Static Pages
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Users
  devise_for :users, controllers: {   
    omniauth_callbacks: 'users/omniauth_callbacks', 
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show, :edit, :update]

  # Events
  resources :events, only: [:index, :show]
  resources :event_logs

end
