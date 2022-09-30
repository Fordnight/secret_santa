Rails.application.routes.draw do
  #devise_for :users
  get 'welcome/index'

  resources :articles
  resources :lists

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'welcome#index'
end
