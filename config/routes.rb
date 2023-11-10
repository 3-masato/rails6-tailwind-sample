Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks, only: [:edit, :index, :create, :destroy, :update]
end
