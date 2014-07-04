Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts, only: [:index, :new, :create] do
    resources :meows, only: [:create]
  end
end
