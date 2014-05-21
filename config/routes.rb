App::Application.routes.draw do
  root to: "static_pages#root"

  resources :users, only: [:create, :new, :destroy]
  resource :session, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:edit, :index]
    get '/user', to: 'users#show', as: 'user'

    resources :interests, only: [:show]
  end


end
