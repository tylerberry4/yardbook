Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => {sessions: 'sessions'}
  resources :students
  resources :admins
  apipie

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :users, only: [:index]
      resources :students
      resources :admins
    end
  end
end
