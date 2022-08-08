Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
    resources :invitations, only: %i[create] do
      member do
        put :agree
      end
    end
  end
    end
=======

    put "marks", to: "project_marks#edit"
>>>>>>> 474c8a9ed6d587dd8e5f1fad090fc2c3e120033d
  end

  resources :comments, only: [:create, :update, :destroy]

  resources :comments, only: [:create, :update, :destroy]

  resources :favorites, only: %i[index create]
  delete :favorites, to: "favorites#destroy"

  get 'dashboard', to: 'users#dashboard'
  put 'change_locale', to: 'users#change_locale'
  
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      resources :tasks, only: :show
    end
  end
end
