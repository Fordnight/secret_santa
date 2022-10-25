# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles

  get 'pokemons', to: 'pokemons#index'
  get 'pokemons/show/:name', to:'pokemons#show', as: 'pokemons_show'


  resources :lists do
    get 'play', on: :member
  end


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'welcome#index'
end
