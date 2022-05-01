Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users

  resources :projects do
    member do
      put :archive
    end
    resources :tasks
  end
end
