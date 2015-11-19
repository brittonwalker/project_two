class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params.merge(:user_id => current_user.id))
    redirect_to posts_path
  end

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
    params.require(:post).permit(:title, :body, :user_id)
  end

end
