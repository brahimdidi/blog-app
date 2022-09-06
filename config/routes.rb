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
  # root "articles#index"
end
