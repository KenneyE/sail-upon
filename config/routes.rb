App::Application.routes.draw do
  root to: "users#show"
  resources :users, only: [:create, :new, :destroy]
  resource :session, only: [:create, :new, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :edit]
  end

end
