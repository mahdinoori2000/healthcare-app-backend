Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  post '/login', to: 'sessions#create'
  post '/signup', to: 'registrations#create'

  # Define api routes for versioning purposes
  namespace :api do
    namespace :v1 do
      resources :users
      resources :doctors ,only: [:index,:show,:create, :destroy]  do
      resources :appointments ,only: [:index,:create,:destroy]
      end
      resources :appointments, only:[:index]
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
