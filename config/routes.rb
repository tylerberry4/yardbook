Rails.application.routes.draw do
  apipie
  root 'welcome#index'
  devise_for :users, :controllers => {sessions: 'sessions'}
  resources :students
  resources :admins

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :users, only: [:index]
      resources :students
      resources :admins
    end
  end
end
