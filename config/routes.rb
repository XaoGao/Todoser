Rails.application.routes.draw do
  get 'pages/about_us', as: :about_us
  get 'pages/contacts', as: :contacts
  root "welcome#index"
  devise_for :users

  resources :projects do
    member do
      put :archive
    end
    resources :tasks do
      member do
        put :move
      end
    end
  end

  get 'dashboard', to: 'users#dashboard'

  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
    end
  end
end
