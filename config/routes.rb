# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "posts#index"

  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get    "/logout",  to: "sessions#show"

  resources :posts do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[new create]
  end
  resources :users, only: %i[new create]
end
