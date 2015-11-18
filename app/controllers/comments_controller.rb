class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params.merge(:post_id => @post))
    @comment = current_user.comments.create!(comment_params)
    redirect_to posts_path(@post, @comment)
  end

  # def show
  #   @user = current_user
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.find(params[:id])
  # end

  def destroy
    @post = Post.comments.find(params[:post_id])
    @post.destroy
    @comments = @post.comments.destroy

    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_user
    @user = current_user
  end

end
