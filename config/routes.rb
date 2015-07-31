Rails.application.routes.draw do
  root to: "trip_plans#index"
  resources :trip_plans
  resources :users, only: [:new, :create, :show]
  resources :user_sessions, only: [:new, :create, :destroy]
end
