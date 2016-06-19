Rails.application.routes.draw do


  root 'home#index'
  get '/chats_list' => 'chats#chats_list'
  get '/users_list' => 'users#users_list'
    resources :chats, only: [:show, :index] do
    resources :comments, only: [:new, :create]
  end

  resources :comments, only: [:edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index, :show]
  resources :profiles do
    resources :chats, only: [:new, :create]
    resources :locations, only: [:new, :create], module: :profiles
  end
  resources :chats, only: [:edit, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
