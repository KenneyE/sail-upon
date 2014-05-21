App::Application.routes.draw do
  root to: "static_pages#root"

  resources :users, only: [:create, :new, :destroy]
  resource :session, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:edit, :index, :show] do
      resources :interests, shallow: true
    end
    # get '/user', to: 'users#show', as: 'user'
  end


end
