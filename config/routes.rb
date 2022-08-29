Rails.application.routes.draw do
  resources :users, only: [:index, :show] , shallow: true do
    resources :comments, only: [:index, :show] 
    resources :posts, only: [:index, :show] 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
