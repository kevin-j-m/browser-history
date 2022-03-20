Rails.application.routes.draw do
  resources :foos
  root "queries#new"

  resources :queries, only: [:create, :index, :new, :show]
end
