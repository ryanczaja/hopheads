Hopheads::Application.routes.draw do

  get "breweries/show"

  get "users/show"

  resources :posts do
  	resources :comments, only: [:create, :destroy]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show]
  resources :breweries, only: [:show]

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
