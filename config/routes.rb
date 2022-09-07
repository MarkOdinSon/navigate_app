Rails.application.routes.draw do
  devise_for :users, :controllers => {:invitations => "invitations"}

  root to: "pages#home"

  get "/up/", to: "up#index", as: :up
  get "/up/databases", to: "up#databases", as: :up_databases

  # routes for posts starting

  get "/posts", to: "post#show_all_posts" # by default filtered by date of upload
  get "/post/:id", to: "post#show_selected_post"
  get "/post/new", to: "post#show_create_post"
  get "/post/edit/:id", to: "post#show_edit_post"

  post "postRequest/post/create/", to: "post#do_create_post"
  post "postRequest/post/save_changes/:id", to: "post#do_edit_post"
  delete "postRequest/post/remove/:id", to: "post#do_remove_post"

  # routes for posts ending

end
