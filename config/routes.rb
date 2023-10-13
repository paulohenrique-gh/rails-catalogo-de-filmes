Rails.application.routes.draw do
  root to: 'home#index'

  resources :genres, only: [:show, :new, :create, :edit, :update]
  resources :directors, only: [:show, :new, :create, :edit, :update]
  resources :movies, only: [:show, :new, :create, :edit, :update]
end
