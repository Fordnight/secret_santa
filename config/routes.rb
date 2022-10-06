# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles
  resources :lists

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'welcome#index'
end
