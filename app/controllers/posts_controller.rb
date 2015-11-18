class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_filter :find_user

  def index
    @user = current_user
    @posts = Post.all
    @post = Post.where(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_user
    @user = current_user
  end

end
