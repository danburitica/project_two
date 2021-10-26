Rails.application.routes.draw do
  
  get 'pages/home'
  get 'pages/profile'
  devise_for :users
end
