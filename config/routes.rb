Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :user do
    root :to => 'profiles#index'
end

  resources :profiles, only: [:show]
  get '/discover', to: 'profiles#index', as: :discover
  get '/settings', to: 'profiles#settings', as: :settings
  post '/newphoto', to: 'photos#new', as: :new_photo
  post '/createphoto', to: 'photos#create', as: :create_photo
  get '/showform', to: 'pages#show_form', as: :show_form
  post '/likes/update', to: 'likes#update'
  post '/profiles/locate', to: 'profiles#locate'
  post '/profiles/locate', to: 'profiles#locate'
  post '/profiles/range', to: 'profiles#range'
  get '/pages/chooseform', to: 'pages#choose_form'
end
