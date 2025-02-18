Rails.application.routes.draw do
  root "static_pages#home"

  get 'static_pages/home'
  get 'static_pages/help', as: 'help'
  get 'static_pages/about', as: 'about'

  get 'signup', to: 'users#new'
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy" 

  resources :users
  resources :tweets, only: [:create, :destroy]
  get '/tweets', to: 'static_pages#home'

  get "up" => "rails/health#show", as: :rails_health_check
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
end
