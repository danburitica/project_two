Rails.application.routes.draw do
  root to: 'pages#home'
  get 'home', to: 'pages#home'
  get 'profile', to: 'pages#profile'
  get 'feed', to: 'pages#feed'
  get 'seen', to: 'seen_post#mark'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
  end
  resources :posts, only: [:create, :destroy]
end
