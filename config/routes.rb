Rails.application.routes.draw do
  get 'welcome/index'
  get '/index' => 'users#index'


  devise_for :users
  resources :items
  resources :friendships

  root 'welcome#index'
  get ':username' => 'users#show'

end
