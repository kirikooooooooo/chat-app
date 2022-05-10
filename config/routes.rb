Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "rooms#index"
  resources :users, Only: [:edit, :Update]
  resources :rooms, Only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
