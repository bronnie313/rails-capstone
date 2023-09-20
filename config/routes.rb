Rails.application.routes.draw do
  devise_for :users
  resources :icome_transactions,  only: [:index, :show, :new, :create, :destroy]
  resources :categories,  only: [:index, :show, :new, :create, :destroy]
  resources :users,  only: [:index, :show, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # config/routes.rb
  root 'splash#index'
  get '/redirect_to_login', to: 'splash#redirect_to_login', as: :redirect_to_login

end
