Rails.application.routes.draw do
  
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root 'welcome#index'
  get 'portfolio', to: 'users#profile'
  get 'search_stock', to: 'stocks#search'
  get 'edit_user_registration', to: 'users#edit'

end
