Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get "users/show" => "users#show"
  root 'pages#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :collections
  resources :items do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    get :search, on: :collection
  end
  resources :users, only:[:index, :new, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  get "items/:id" => "items#show"
  get "collections/:id" => "collections#show"
  get "pages/show/:article_id", to: "pages#show"
end
