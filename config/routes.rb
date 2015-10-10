Rails.application.routes.draw do

  resources :wallpapers
  # resources :tags

  root 'home#index'
end
