Rails.application.routes.draw do
  get "/shoes" => "shoes#index"
  get "/shoes/new" => "shoes#new"
  post "/shoes/create" => "shoes#create"
  get "/shoes/:id" => "shoes#show"
  get "/shoes/:id/edit" => "shoes#edit"
  patch "/shoes/:id" => "shoes#update"
  delete "/shoes/:id" => "shoes#destroy"
end