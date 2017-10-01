Rails.application.routes.draw do
  get "/" => "avocados#index"
  get "/avocados/new" => "avocados#new"
  post "/avocados" => "avocados#create"
  get "/avocados/:id" => "avocados#show"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
