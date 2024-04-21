Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  get 'home/about', to: "homes#about"


  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:edit,:show, :update, :index]
end
