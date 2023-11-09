Rails.application.routes.draw do
  root to: "homes#top"
  get "about" => "homes#about"

  resources :tasks, only: [:edit, :index, :create, :destroy, :update]
end
