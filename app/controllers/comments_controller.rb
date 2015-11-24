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

  def edit
    # NHO: How could we lock down these actions to protect users from editing other users comments?
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def update
    # NHO: How could we lock down these actions to protect users from editing other users comments?
    @comment = Comment.find(params[:id])
    @comment.update(comment_params.merge(user:current_user))
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
