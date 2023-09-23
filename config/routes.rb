Rails.application.routes.draw do 
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

end
