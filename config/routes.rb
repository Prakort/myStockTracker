Rails.application.routes.draw do
  
  devise_for :users
  resources :friendships, only: [:create, :destroy]
  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  root 'welcome#index'
  get 'portfolio', to: 'users#profile'
  get 'search_stock', to: 'stocks#search'
  get 'edit_user_registration', to: 'users#edit'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'

end
