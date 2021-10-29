Rails.application.routes.draw do
  get 'seen_post/mark'
  root to: 'pages#home'
  get 'home', to: 'pages#home'
  get 'profile', to: 'pages#profile'
  get 'feed', to: 'pages#feed'
  devise_for :users
end
