Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books
  resources :users, only: [:create, :show, :edit, :index, :update]
  get "home/about" => "homes#about", as: "about"

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
