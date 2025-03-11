Rails.application.routes.draw do
  # Authentication Routes
  post '/signup', to: 'users#signup'
  post '/login', to: 'users#login'

  resources :events do
    member do
      post 'add_user'   
      delete 'remove_user' 
    end
  end
  post "/users/:id/upload_image", to: "users#upload_image"
  resources :categories, only: [:index, :create]

  resources :user_events, only: [:create]
end
