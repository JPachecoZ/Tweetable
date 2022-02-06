Rails.application.routes.draw do
  resources :tweets, :likes
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }
  resources :users
  resources :users do
    resources :tweets
    resources :likes
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/tweets/:tweet_id/replies", to: "tweets#create"  
  # Defines the root path route ("/")
  root "tweets#index"

  resources :tweets do
    resources :replies
  end

  namespace :api do
    resources :users
    resources :tweets
  end
  # Devise Omniauth
  # get "/auth/github/callback", to: "callbacks#github"
end
