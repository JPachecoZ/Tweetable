Rails.application.routes.draw do
  resources :tweets
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"

  # Devise Omniauth
  # get "/auth/github/callback", to: "callbacks#github"
end
