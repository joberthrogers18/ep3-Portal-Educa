Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :articles do
  resources :comments
end

    root to: 'articles#index'

resources :tags
end
