class PostController < ApplicationController
  def list # by default filtered by date of upload
    @title_of_page = 'Posts'
    @active_page = 'Posts'

    @posts = Post.all.order(:created_at)
  end

  def show
    @title_of_page = 'Post #'
    @active_page = 'Posts'

    @post = Post.find(params[:id])
  end

  def new
    @title_of_page = 'Create a new post'
    @active_page = 'Posts'
  end

  def edit
    @title_of_page = 'Edition of the post #'
    @active_page = 'Posts'

    @post = Post.find(params[:id])
  end

  def create
    if Post.create(owner: current_user.id, title: params[:post][:title], body: params[:post][:body]).save
      flash.notice = "The post has been created successfully."
      id = Post.where(owner: current_user.id).last.id
      redirect_to "/posts/#{id}"
    else
      flash.alert = "The post has not been created. Something go wrong."
      redirect_to "/posts/"
    end
  end

  def update
    if Post.find(params[:id]).update(title: params[:post][:title], body: params[:post][:body])
      flash.notice = "The post has been updated successfully."
      redirect_to "/posts/#{params[:id]}"
    else
      flash.alert = "The post has not been updated. Something go wrong."
      redirect_to "/posts/"
    end
  end

  def delete
    if Post.find(params[:id]).delete
      flash.notice = "The post has been deleted successfully."
    else
      flash.alert = "The post has not been deleted. Something go wrong."
    end
    redirect_to "/posts/"
  end
end