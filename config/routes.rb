Rails.application.routes.draw do
  resources :posts
  resources :foos
  root "queries#new"

  resources :queries, only: [:create, :index, :new, :show] do
    resources :comments, module: :queries, only: [:create]
  end
end
