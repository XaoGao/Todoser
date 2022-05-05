Rails.application.routes.draw do
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
end
