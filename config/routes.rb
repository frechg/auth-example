Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'

  resource :users, only: [:create]
  get '/join', to: 'users#new'

  get '/authenticate', to: 'sessions#new'
  post '/authenticate', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

end
