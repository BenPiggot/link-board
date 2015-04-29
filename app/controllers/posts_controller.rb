class PostsController < ApplicationController

  before_action :is_authenticated?

  def index
    @posts = current_user.posts
  end


  def new
    @post = Post.new
  end



  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  def edit
    @post = current_user.posts.find(params[:id])
  end


  def update
    @post = current_user.posts.update(params[:id], post_params)
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end