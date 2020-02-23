Rails.application.routes.draw do
  resources :permissions
  devise_for :users
  resources :rooms
  
  root 'rooms#index'
end
