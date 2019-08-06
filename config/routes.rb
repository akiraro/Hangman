Rails.application.routes.draw do

  root "home#index"

  resources :seshes
  resources :game
end
