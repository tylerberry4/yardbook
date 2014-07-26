Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, :controllers => {sessions: 'sessions'}
  resources :users, only: [:index, :create]
  resources :students, only: :index
  resources :admins, only: :index
end
