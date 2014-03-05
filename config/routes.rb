Hopheads::Application.routes.draw do

  resources :posts do
  	resources :comments, only: [:create]
  end

  devise_for :users

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
