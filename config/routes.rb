Rails.application.routes.draw do
  root 'pages#home'
  get 'home', to: 'pages/home'
  get 'profile', to: 'pages/profile'
  get 'feed', to: 'pages/feed'
  devise_for :users
end
