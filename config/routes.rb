Rails.application.routes.draw do
  get "/" => "avocados#index"
  get "/avocados" => "avocados#index"
  get "/avocados/new" => "avocados#new"
  post "/avocados" => "avocados#create"
  get "/avocados/json" => "avocados#json"
  get "/avocados/charts" => "avocados#charts"
  get "/avocados/show_all" => "avocados#redirect"
  get "/avocados/show_all/:page" => "avocados#show_all"
  get "/avocados/search" => "avocados#search"
  get "/avocados/:id" => "avocados#show"
  get "/avocados/map" => "avocados#map"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
