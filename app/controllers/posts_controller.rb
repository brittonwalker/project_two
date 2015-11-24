class PostsController < ApplicationController
  load_and_authorize_resource # NHO: This helper can be utilized to DRY up our controller code, let's take advantage!

  def index
    @posts = Post.order('updated_at DESC') # NHO: this works! Have also seen. Post.all.order('updated_at DESC')
    @post = Post.where(params[:id]) # NHO: I think we want `Post.find` to grab the one post here.
    @comment = Comment.new
  end

  def show
    @post = Post.find(params[:id]) # NHO: Line no longer necessary because of load part of load_and_authorize_resource, same with edit, update, destroy
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create!(post_params)
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
    params.require(:post).permit(:title, :body, :user_id, :img_url)
  end

end
