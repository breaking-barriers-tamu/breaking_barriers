Rails.application.routes.draw do 
  # Admin
  authenticated :user, ->(user) { user.can_access_admin_dashboard? } do
    namespace :admin do
      resources :editable_contents
      resources :events do
        member do
          delete :purge_flier
        end
      end

      resources :users do
        get 'export_participation_data', on: :collection
      end

      resources :event_logs do
        patch 'confirm_participation', on: :member
      end

      get 'help', to: 'admin#help'
      root to: 'admin#index'
    end
  end

  # Static Pages
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'help', to: 'pages#help'

  # Users
  devise_for :users, controllers: {   
    omniauth_callbacks: 'users/omniauth_callbacks', 
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }
  authenticated :user, ->(user) { true } do
     resources :users, only: [:show, :edit, :update]
    # Events
    resources :events, only: [:index, :show]
    resources :event_logs do 
      member do
        get :delete
      end
    end
  end

  # Announcements and Comments
  resources :announcements do
    collection do
      post :load_more, to: 'announcements#load_more'
    end
    resources :comments
  end
end
