Rails.application.routes.draw do
  devise_for :users

  resources :post_comments
  resources :posts
  resources :tasks

  root to: 'users#index'

  post   '/users',     to: 'users#create',  as: 'users' #adds _path to as
  get    '/users/:id', to: 'users#show',    as: 'user'
  delete '/users/:id', to: 'users#destroy', as: 'destroy'
  patch  '/users/:id', to: 'users#update'

  get    '/login',     to: 'sessions#new'
  get    '/logout',    to: 'sessions#destroy'

  post   '/sessions',  to: 'sessions#create'

  get "/pages/:page" => "pages#show"
end
