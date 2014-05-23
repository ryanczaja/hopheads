Hopheads::Application.routes.draw do

  resources :styles, only: [:index, :show]

  resources :posts do
  	resources :comments, only: [:create, :destroy], controller: 'posts/comments'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :users, only: [:show]

  resources :breweries, only: [:show] do
    resources :comments, only: [:create, :destroy], controller: 'breweries/comments'
  end

  resources :beers, only: [:show] do 
    resources :comments, only: [:create, :destroy], controller: 'beers/comments'
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
