Rails.application.routes.draw do

  root 'welcome#index'

  delete '/logout' => 'sessions#destroy'

  resources :dashboard
  resources :employments
  resources :events
  resources :friendships
  resources :profiles
  resources :sessions
  resources :users
  resources :searched

  resources :messages do
    resources :responses
  end

end
