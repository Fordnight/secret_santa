Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :articles
  resources :lists

  root 'welcome#index'
end
