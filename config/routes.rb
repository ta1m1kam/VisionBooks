# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
<<<<<<< HEAD
  get  '/about', to: 'static_pages#about'
=======
  resources :books
>>>>>>> 6557dd8bbddb77908efd6bddde35a3138bf09b94
end
