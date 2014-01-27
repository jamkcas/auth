AuthApp::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create]

  get '/logout' => 'sessions#destroy'

end
