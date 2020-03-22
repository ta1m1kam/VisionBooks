# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get  '/signup', to: 'users#new'
  resources :users
end
