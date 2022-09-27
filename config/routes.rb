Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles
  resources :lists

  root 'welcome#index'
end
