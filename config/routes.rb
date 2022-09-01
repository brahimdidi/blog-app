Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
