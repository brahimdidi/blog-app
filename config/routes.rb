Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments
      resources :likes, only: %i[new create]
    end
  end
  # Defines the root path route ("/")
  post '/likes/new', to: 'likes#create'
  get '/posts', to: 'posts#all_posts'
  root 'users#index'

  namespace :api do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end

  namespace :api do
    resources :authentications, only: :create
  end
end
