Rails.application.routes.draw do 
  # Admin
  authenticated :user, ->(user) { user.can_access_admin_dashboard? } do
    namespace :admin do
          resources :users
      root to: 'admin#index'
    end
  end
  authenticated :user, ->(user) { user.can_access_officer_dashboard? } do
    get 'officer', to: 'officer#index'
    get 'officer/users_view'
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
  #resources :events, only: [:index, :show]
  resources :events
  resources :event_logs

end
