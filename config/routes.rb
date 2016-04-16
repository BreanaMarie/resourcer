Rails.application.routes.draw do

  root 'welcome#index'

  delete '/logout' => 'sessions#destroy'

  resources :employments
  resources :profiles
  resources :users
  resources :sessions

end
