Kakesan::Application.routes.draw do
  root to: 'sessions#new'
  resources :sessions, only: [:new] do
    get :check, on: :collection
  end
  resources :themes, only: [:new, :create, :index, :show]
  resources :entries, only: [:create]
  resources :comments, only: [:create]
  resources :users, only: [:new, :create, :show, :edit, :update]
  namespace :private do
    resources :themes, only: [:index]
  end
  match '/auth/:provider/callback', to: 'authentifications#callback'
  match '/auth/failure'           , to: 'authentifications#failure'
end
