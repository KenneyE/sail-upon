App::Application.routes.draw do
  root to: "static_pages#root"

  resources :users, only: [:create, :new, :destroy]
  resource :session, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:edit, :index, :show] do
      resources :interests, shallow: true
    end

    # resources :websites
    get '/websites', to: 'websites#show'
    # get '/user', to: 'users#show_current'
    get '/interests', to: 'interests#full_index'

    post '/user_interests/:interest_id', to: 'user_interests#create'
    delete '/user_interests/:interest_id', to: 'user_interests#destroy'
  end
end
