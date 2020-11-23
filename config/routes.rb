Rails.application.routes.draw do
  devise_for :users
  get "users/show" => "users#show"
  root 'pages#index'
  resources :collections
  resources :items
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
