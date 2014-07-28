Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  resources :users, only: :index
  resources :students, only: :index
  resources :admins, only: :index
end
