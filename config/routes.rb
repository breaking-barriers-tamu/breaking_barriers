Rails.application.routes.draw do
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  resources :users
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    delete 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  # Defines the root path route ("/")
  # root to: 'dashboards#show'
  root "events#index"
end
