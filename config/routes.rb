Rails.application.routes.draw do
  root 'rooms#home'
  get 'users/index'
  get 'rooms/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users
end
