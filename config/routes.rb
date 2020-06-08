# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/about', to: 'static_pages#about'
  resources :books
  resources :users
end
