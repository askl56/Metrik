Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end
end
