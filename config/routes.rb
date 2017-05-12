Rails.application.routes.draw do

  resources :days
  resources :activities
  resources :themes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users

  resources :trips
  resources :accounts
  resources :charges

  root 'trips#index'
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
