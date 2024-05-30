Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root to: "application#index"

  namespace :api do
    namespace :v1 do
      resources :chatrooms, only: [:index, :new, :show, :create, :update, :destroy]
      resources :sessions, only: [:create]
      resources :chats, only: [:index, :create, :show]
      namespace :auth do
      end
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }
    end
  end
  
  get "up" => "rails/health#show", as: :rails_health_check
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  # Defines the root path route ("/")
  # root "posts#index"
end
