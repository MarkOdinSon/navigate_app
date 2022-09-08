Rails.application.routes.draw do
  devise_for :users, :controllers => {:invitations => "invitations"}

  root to: "pages#home"

  get "/up/", to: "up#index", as: :up
  get "/up/databases", to: "up#databases", as: :up_databases

  # routes for posts starting

  get "/posts", to: "post#list"
  get "/posts/:id", to: "post#show"
  get "/post/new", to: "post#new"
  get "/posts/edit/:id", to: "post#edit"

  post "/posts", to: "post#create"
  patch "/posts/:id", to: "post#update"
  delete "/posts/:id", to: "post#delete"

  # routes for posts ending

end
