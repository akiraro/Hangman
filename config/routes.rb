Rails.application.routes.draw do

  root "home#index"

  resources :seshes
  resources :game
  resources :auth

  post '/auth/signup', to: "auth#signup"
  post '/auth/login', to: "auth#login"
  delete 'auth/logout', to: "auth#destroy"
  post '/rngame/:id', to: "game#rnedit"
  post '/newgame', to: "seshes#rncreate"
end
