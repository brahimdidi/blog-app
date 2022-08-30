Rails.application.routes.draw do
  resources :users, only: %i[index show], shallow: true do
    resources :comments, only: %i[index show]
    resources :posts, only: %i[index show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
