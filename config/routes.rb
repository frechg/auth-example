Rails.application.routes.draw do

  root 'users#index'

  resource :users, only: [:create]
  get '/join', to: 'users#new'

  get '/authenticate', to: 'sessions#new'
  post '/authenticate', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
