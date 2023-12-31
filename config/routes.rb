Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :create, :index, :show, :destroy,:edit,:update]
  get "/home/about" => "homes#about", as: "about"
  resources :users, only: [:show, :edit,:update,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
