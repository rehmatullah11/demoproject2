Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users 
  # resources :pages

  # get '/login', to: "pages#new"
  # get '/signup', to: "pages#index"
  resources :users, only: [:show]

  root to: "pages#index"

  resources :projects do
    resources :bugs
  end

end
