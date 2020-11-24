# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'books/index'
  get 'books/new'
  root 'static_pages#home'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/about', to: 'static_pages#about'
  resources :books do
    collection do
      get 'search'
    end
  end
  resources :books, only: %i[index show edit update] do
    member do
      # 追加したeditとupdateアクション
      get 'edit_detail'
      patch 'update_detail'
    end
  end
  resources :users
end
