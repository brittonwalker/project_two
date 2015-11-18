class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    # @comment = Comment.create!(comment_params.merge(:post_id => @post))
    @comment = @post.comments.create!(comment_params.merge(:post_id => @post))
    # @comment = Comment.create!(comment_params.merge(post: @Post))
    redirect_to posts_path(@post, @comment)
  end

  def show
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_user
    @user = current_user
  end

end
