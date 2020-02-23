Rails.application.routes.draw do
  resources :amenity_rooms
  resources :amenities
  resources :roles
  resources :permissions
  devise_for :users
  resources :rooms
  
  root 'rooms#index'
end
