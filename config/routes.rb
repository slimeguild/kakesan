Kakesan::Application.routes.draw do
  root :to => 'sessions#new'
  resources :sessions, only: [:new]
  resources :events, only: [:new, :create, :index]
  match '/auth/:provider/callback', to: 'authentifications#callback'
  match '/auth/failure'           , to: 'authentifications#failure'
end
