Rails.application.routes.draw do

  root 'welcome#index'

  resources :employments
  resources :profiles
  resources :users

end
