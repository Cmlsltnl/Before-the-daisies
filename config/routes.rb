Rails.application.routes.draw do
  get 'contact/index'

  get 'about/index'

  get 'features/index'

  get 'welcome/index'
  get '/index' => 'users#index'

  get '/find_friends' => 'friendships#index'


  devise_for :users


  resources :items do
    resources :comments 
  end
  

  resources :items
  get '/facebook' => 'items#facebook'

  resources :friendships

  root 'welcome#index'
  get ':username' => 'users#show', as: :user

end
