Rails.application.routes.draw do
  devise_for :users
  resources :icome_transactions
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "categories#index"
  # config/routes.rb
  root 'splash#index'
  get '/redirect_to_login', to: 'splash#redirect_to_login', as: :redirect_to_login

end
