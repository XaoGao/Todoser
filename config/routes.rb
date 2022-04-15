Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users

  resources :projects do
    resources :tasks, except: [:new, :edit, :show]
  end
end
