class PostsController < ApplicationController

  before_action :is_authenticated?

  def index
    @posts = Post.all
    @vote = Vote.new
    respond_to do |format|
      format.json { render json:@posts}
      format.xml {render xml:@posts}
      format.html
    end
  end


  def new
    @post = Post.new
  end



  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path
  end


  def show
    @vote = Vote.new
    @comment = Comment.new
    @post = Post.find(params[:id])
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
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end