Hopheads::Application.routes.draw do

  get "users/show"

  resources :posts do
  	resources :comments, only: [:create, :destroy]
  end

  devise_for :users

  resources :users, only: [:show]

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
