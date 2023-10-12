Rails.application.routes.draw do 
  # Admin
  authenticated :user, ->(user) { user.can_access_admin_dashboard? } do
    namespace :admin do
      resources :events do
        patch 'update_participation', on: :member
      end
      resources :users

      resources :event_logs

      root to: 'admin#index'
    end
  end
  # Officer
  # authenticated :user, ->(user) { user.can_access_officer_dashboard? } do
  #   namespace :officer do
  #     resources :events
  #     resources :users
  #     root to: 'officer#index'
  #     resources :event_logs do
  #       patch 'update_participation', on: :member
  #     end
  #   end
  # end

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
  authenticated :user, ->(user) { true } do
    resources :users, only: [:show]
  end

  # Events
  resources :events, only: [:index, :show]
  resources :event_logs do 
    member do
      get :delete
   end
  end

  resources :announcements

end
