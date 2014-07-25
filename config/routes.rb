Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :index
  welcome#index
end
