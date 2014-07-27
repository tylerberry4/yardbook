Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, :controllers => {sessions: 'sessions'}
  resources :users, only: [:index]
  resources :students, only: [:index, :show, :new, :create, :destroy, :update]
  resources :admins, only: [:index, :show, :new, :create, :destroy, :update]
end
