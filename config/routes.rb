Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts do
    collection do
      get 'indexabout'
    end
    resources :post_likes, only: [:create, :destroy]
    resources :comments, only: :create do
      resources :likes, only: [:create, :destroy]
    end
  end
end
