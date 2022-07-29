Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users

  get "pages/about_us", as: :about_us
  get "pages/contacts", as: :contacts

  resources :projects do
    member do
      put :archive
    end

    resources :tasks do
      member do
        put :move
      end
    end

    put "marks", to: "project_marks#edit"
  end


  resources :comments, only: [:create, :update, :destroy]

  resources :favorites, only: %i[index create]
  delete :favorites, to: "favorites#destroy"

  get 'dashboard', to: 'users#dashboard'

  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      resources :tasks, only: :show
    end
  end
end
