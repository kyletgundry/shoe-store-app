Rails.application.routes.draw do
  get "/" => "shoes#index"
  get "/shoes" => "shoes#index"
  get "/shoes/new" => "shoes#new"
  post "/shoes" => "shoes#create"
  get "/random_product" => "shoes#random"
  get "/shoes/:id", to: "shoes#show", as: "shoe"
  get "/shoes/:id/edit" => "shoes#edit"
  patch "/shoes/:id" => "shoes#update"
  delete "/shoes/:id" => "shoes#destroy"
  
  post "/shoes_search" => "shoes#search"
  get "/suppliers" => "suppliers#index"
  get "/suppliers/new" => "suppliers#new"
  post "/suppliers" => "suppliers#create"
  get "/suppliers/:id" => "suppliers#show"
  get "/suppliers/:id/edit" => "suppliers#edit"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"
  
  get "/images" => "images#index"
  get "/images/new" => "images#new"
  post "/images" => "images#create"
  get "/images/:id" => "images#show"
  get "/images/:id/edit" => "images#edit"
  patch "/images/:id" => "images#update"
  delete "/images/:id" => "images#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/orders" => "orders#index"
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  post "/carted_shoes" => "carted_shoes#create"
  get "/carted_shoes" => "carted_shoes#index"
  delete "/carted_shoes/:id" => "carted_shoes#destroy"
  
end