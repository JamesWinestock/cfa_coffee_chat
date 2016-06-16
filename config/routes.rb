Rails.application.routes.draw do
  resources :chats, only: :show do
    resources :comments, only: [:new, :create]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index, :show]
  resources :profiles do
    resources :chats, only: [:new, :create, :edit]
    resources :locations, only: [:new, :create], module: :profiles
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
