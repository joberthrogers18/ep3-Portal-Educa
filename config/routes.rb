Rails.application.routes.draw do
  resources :categoria
  resources :sobres
  get 'users/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :path_prefix => 'd'
resources :users, :only =>[:show]
match '/users',   to: 'users#index',   via: 'get'
match '/users/:id',     to: 'users#show',       via: 'get'

  resources :articles do
  resources :comments
end
resources :comments
    root to: 'articles#index'

resources :tags
end
