Rails.application.routes.draw do
  get '/search' => 'search#search'
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
end