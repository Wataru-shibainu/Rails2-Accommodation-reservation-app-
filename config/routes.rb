Rails.application.routes.draw do
 
  devise_for :users, :controllers => {
#    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
#    :sessions => 'users/sessions',
#    :passwords => 'users/passwords'
   }
  
  root 'rooms#home'

  get 'users/account'
  get 'users/profile'
  get 'users/profile_edit'
  
  get 'rooms/home'
  get 'rooms/after_login'
  get 'rooms/own'
  get 'rooms/search_result'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users
  resources :rooms
  
end
