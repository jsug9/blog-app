Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
  resources :posts, only: [:new, :create]
  
  # API routes
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end
end
