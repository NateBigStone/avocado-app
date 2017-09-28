Rails.application.routes.draw do
  get "/" => "avocados#index"
  get "/avocados/new" => "avocados#new"
  post "/avocados" => "avocados#create"
  get "/avocados/:id" => "avocados#show"
end
