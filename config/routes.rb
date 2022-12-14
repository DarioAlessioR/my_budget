Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :categories do
    resources :payments, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#welcome"
end
