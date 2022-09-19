class PostController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @title_of_page = 'All the Posts'
    @posts = Post.order(created_at: :desc)
  end

  def show
    @title_of_page = 'Show the post'
  end

  def new
    @title_of_page = 'Create a new post'
    @post = Post.new
  end

  def edit
    @title_of_page = 'Editing the post'
  end

  def create
    @post = Post.create(owner: current_user.id, title: params[:post][:title], body: params[:post][:body])
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to post_url, alert: "Post was successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end