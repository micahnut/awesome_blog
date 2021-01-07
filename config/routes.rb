Rails.application.routes.draw do

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'sessionsnew/create'
  # get 'sessionsnew/destroy'
  # get 'users/new'
  root 'static_pages#home'
  
  # get '/home', to: 'static_pages#home'
  # HTTP action '/route-name', to: 'controller_name#action'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'

  # Complete CRUD routes for user only
  resources :users

  # New, create and Destroy for sessions
  resources :sessions, only: [:new, :create, :destroy]

  #create and destroy for micropost
  # create -> post button
  # destroy -> delete button to delete post
  resources :microposts, only: [:new, :create, :destroy]  

  #for follow and unfollow
  resources :relationships, only: [:create, :destroy]
  
  # /login
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  # get 'static_pages/home'
  # get 'static_pages/about'
  # get 'static_pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
