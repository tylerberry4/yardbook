Rails.application.routes.draw do
  apipie
  root 'welcome#index'

  devise_for :users, :controllers => {sessions: 'sessions'}
  resources :users, only: [:index]
  resources :students
  resources :admins, only: [:index, :show, :new, :create, :destroy, :update]
end
