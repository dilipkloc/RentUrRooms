Rails.application.routes.draw do
  resources :cities
  resources :amenity_rooms
  resources :amenities
  resources :roles
  #devise_for :users
  resources :rooms

  get '/errors', to: 'errors#index'

  devise_for :users,
             :controllers => {:registrations => "my_devise/registrations"}
  
  root 'rooms#index'
end
