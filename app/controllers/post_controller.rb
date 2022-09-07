class PostController < ApplicationController

  # prefix show - means that action has a html template. The action will be completed by returning the web page. Like a get request.
  # prefix do - means that action has no html template. The action will be completed by performing a database operation and redirecting to another page. Like a post request

  def show_all_posts # by default filtered by date of upload
    @title_of_page = 'Posts'
    @active_page = 'Posts'

    @posts = Post.all.order(:created_at)
  end

  def show_selected_post
    @title_of_page = 'Post #'


  end

  def show_create_post
    @title_of_page = 'Create a new post'


  end

  def show_edit_post
    @title_of_page = 'Edition of the post #'


  end

  def do_create_post

  end

  def do_edit_post

  end

  def do_remove_post
    if Post.find(params[:id]).delete
      flash.notice = "The post has been removed successfully."
    else
      flash.alert = "The post has not been removed. Something go wrong"
    end
    redirect_to request.referrer
  end

  private

  def posts_params
    params.permit(:title, :body, :owner)
  end
end
