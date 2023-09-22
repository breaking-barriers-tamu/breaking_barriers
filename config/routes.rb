Rails.application.routes.draw do
  root 'static_pages#home'

  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

 resources :users do
    member do
      get 'complete_registration', to: 'users#complete_registration'
      post 'submit_registration', to: 'users#submit_registration'
    end
  end

  resources :events

  devise_for :users, controllers: { sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' }

end
