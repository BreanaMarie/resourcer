Rails.application.routes.draw do

  root 'welcome#index'

  delete '/logout' => 'sessions#destroy'

  resources :dashboard
  resources :employments
  resources :events
  resources :friendships
  resources :messages
  resources :profiles
  resources :sessions
  resources :users

end
