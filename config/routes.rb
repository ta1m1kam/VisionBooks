# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
<<<<<<< HEAD
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
  resources :books
=======
  get  '/about',  to: 'static_pages#about'
>>>>>>> add link_to
end
