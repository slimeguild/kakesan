Kakesan::Application.routes.draw do
  root :to => 'sessions#new'
  resources :sessions, only: [:new]
  match '/auth/:provider/callback', to: 'authentifications#callback'
  match '/auth/failure'           , to: 'authentifications#failure'
end
