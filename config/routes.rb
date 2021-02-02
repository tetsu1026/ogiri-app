Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: :show
  resources :posts do
    resources :comments, only: :create do
      resources :likes, only: [:create, :destroy]
    end
  end
end
