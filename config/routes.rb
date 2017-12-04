Rails.application.routes.draw do
  get 'startup/index'

  resources :articles
end
