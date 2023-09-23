Rails.application.routes.draw do
  root 'splash#home'
  devise_for :users
  resources :users, only: [:index, :show, :new, :create, :destroy]
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :icome_transactions, only: [:index, :show, :new, :create, :destroy]
  end

  # root 'categories#index'
end
