Rails.application.routes.draw do

  resources :wallpapers
  resources :tags, only: [:show]

  root 'home#index'
end
