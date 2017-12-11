Rails.application.routes.draw do
default_url_options :host => "localhost:3000"
  mount Ckeditor::Engine => '/ckeditor'
  get 'users/index'
resources :conversations, only: [:index, :show, :destroy] do
  member do
    post :reply
  end
end

resources :conversations, only: [:index, :show, :destroy] do
  member do
    post :mark_as_read
  end
end

resources :conversations, only: [:index, :show, :destroy] do
  member do
    post :restore
  end
end

resources :conversations, only: [:index, :show, :destroy] do
  collection do
    delete :empty_trash
  end
end 


resources :messages, only: [:new, :create]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :path_prefix => 'd'
resources :users, only: [:show]
match '/users',   to: 'users#index',   via: 'get'
match '/users/:id',     to: 'users#show',       via: 'get'

  resources :articles do
  resources :comments
end
resources :comments
    root to: 'articles#index'

resources :tags
end
