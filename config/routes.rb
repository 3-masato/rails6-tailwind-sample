Rails.application.routes.draw do
  root to: "homes#top"
  get "about" => "homes#about"

  resources :tasks, only: [:new, :edit, :show, :index]
end
