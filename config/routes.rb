Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  resources :collections
  resources :items
  resources :users, only:[:index]
end
