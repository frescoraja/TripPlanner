Rails.application.routes.draw do
  root "trip_plans#index"
  resources :trip_plans, only: [:index, :create]
  resources :users, only: [:new, :create, :index, :show]
  resources :user_sessions, only: [:new, :create, :destroy]
end
