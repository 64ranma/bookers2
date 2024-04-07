Rails.application.routes.draw do
  get 'users/edit'
  get 'users/show'
  root to: "homes#top"
  devise_for :users
  
  get 'homes/about',as:'about'
  
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:edit,:show]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
