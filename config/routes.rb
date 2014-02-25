Hopheads::Application.routes.draw do

  devise_for :users

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
