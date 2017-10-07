Rails.application.routes.draw do
  resources :users

  # user login
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/whoami' => 'users#whoami'
end
