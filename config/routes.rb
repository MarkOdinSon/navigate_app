Rails.application.routes.draw do

  resources :post

  devise_for :users, :controllers => {:invitations => "invitations"}

  root to: "pages#home"

  get "/up/", to: "up#index", as: :up
  get "/up/databases", to: "up#databases", as: :up_databases

end
