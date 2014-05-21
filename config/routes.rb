FinalProject::Application.routes.draw do
  root to: "users#show"
  resources :users, only: [:create, :new, :destroy, :show]
  resource :session, only: [:create, :new, :destroy]
end
