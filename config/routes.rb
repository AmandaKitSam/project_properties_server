Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :users

  # user login
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/whoami' => 'users#whoami'
end
