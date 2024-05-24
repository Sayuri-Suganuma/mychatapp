Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root to: "application#index"

  namespace :api do
    namespace :v1 do
      namespace :auth do
        resources :chatrooms, only: [:index, :new, :show, :create, :update, :destroy]
      end
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }
  
      resources :chats, only: [:index, :new, :show, :create, :update, :destroy]
      devise_scope :user do
        delete 'auth/sign_out', to: 'api/v1/auth/sessions#destroy'
      end
    end
  end
  

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
