Rails.application.routes.draw do
  devise_for :users, :controllers => {:invitations => "invitations"} do
    post  "/users/invitation/create" => "invitations#create", :as => "invitation_create"
  end

  root to: "pages#home"

  get "/up/", to: "up#index", as: :up
  get "/up/databases", to: "up#databases", as: :up_databases

end
