Rails.application.routes.draw do
  resources :foos
  root "queries#new"

  resources :queries, only: [:create, :new, :show]
end
