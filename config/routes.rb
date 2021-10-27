Rails.application.routes.draw do
  root to: 'pages#home'
  get 'home', to: 'pages#home'
  get 'profile', to: 'pages#profile'
  get 'feed', to: 'pages#feed'
  devise_for :users
end
