Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  namespace :user do
    root :to => 'profiles#index'
  end

  get '/pages/chooseform', to: 'pages#choose_form'
  get '/showform', to: 'pages#show_form', as: :show_form

  get '/discover', to: 'profiles#index', as: :discover
  get '/settings', to: 'profiles#settings', as: :settings
  post '/profiles/range', to: 'profiles#range'
  get '/profiles/editbio', to: 'profiles#edit_bio', as: :edit_bio
  get '/profiles/savebio', to: 'profiles#save_bio', as: :save_bio
  patch '/profiles/updateyoutube', to: 'profiles#update_youtube', as: :update_youtube
  patch '/profiles/updatesoundcloud', to: 'profiles#update_soundcloud', as: :update_soundcloud

  get '/photos/new', to: 'photos#new', as: :new_photo
  post '/photos/create', to: 'photos#create', as: :create_photo
  patch '/photos/update', to: 'photos#update', as: :update_photo
  patch '/photos/update_position', to: 'photos#update_position', as: :update_position

  post '/likes/update', to: 'likes#update'

  post 'messages/update', to: 'messages#update_message'
  post 'messages/status', to: 'messages#status'

  resources :conversations, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end
end
