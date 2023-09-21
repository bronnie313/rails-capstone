Rails.application.routes.draw do
  devise_for :users
  resources :categories,  only: [:index, :show, :new, :create, :destroy]  do
    resources :icome_transactions,  only: [:index, :show, :new, :create, :destroy]
  end
  resources :users,  only: [:index, :show, :new, :create, :destroy]

  root 'splash#index'
  get '/redirect_to_login', to: 'splash#redirect_to_login', as: :redirect_to_login

end
