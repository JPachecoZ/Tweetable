Rails.application.routes.draw do
  resources :tweets, :like
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/tweets/:tweet_id/replies", to: "tweets#create"
  # Defines the root path route ("/")
  root "tweets#index"

  resources :tweets do
    resources :replies
  end
  # Devise Omniauth
  # get "/auth/github/callback", to: "callbacks#github"
end
